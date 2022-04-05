#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/mitotags
========================================================================================
    Github : https://github.com/nf-core/mitotags
    Website: https://nf-co.re/mitotags
    Slack  : https://nfcore.slack.com/channels/mitotags
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { MITOTAGS } from './workflows/mitotags'

//
// WORKFLOW: Run main nf-core/mitotags analysis pipeline
//
workflow NFCORE_MITOTAGS {
    MITOTAGS ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_MITOTAGS ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
