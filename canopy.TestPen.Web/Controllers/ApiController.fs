namespace canopy.TestPen.Controllers

open System
open System.Web.Mvc
open data
open FSharp.Data
open System.IO
open helper
open types

type ApiController() =
    inherit BaseController()

    let read (controller : Controller) =
        use strea = controller.HttpContext.Request.InputStream
        let reader = new StreamReader(strea)
        reader.ReadToEnd()

    member this.AddAreas () : JsonResult =
        let run = data.addRun()
        
        let testCases = read this |> TestCases.Parse                               
        testCases.Cases |> Array.iter(fun tc -> 
            let pageId = data.addPage run tc.Page
            let caseId = data.addCase run pageId tc
            data.addAffects run caseId tc
            data.addConfigurations run caseId tc
            tc.TestScenarios |> Array.iter (fun scenario ->
                let scenarioId = data.addScenario run caseId scenario
                data.addInputs run caseId scenarioId scenario.Inputs
                data.addExpecteds run caseId scenarioId scenario.Expected
                data.addAttributes run caseId scenarioId scenario.Attributes
                data.addSteps run caseId scenarioId scenario.Steps)
            )
                
        addReports run testCases.ReportResults

        this.Json(String.Empty, JsonRequestBehavior.AllowGet)