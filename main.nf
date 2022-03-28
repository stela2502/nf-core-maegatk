#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/chrmtags
========================================================================================
    Github : https://github.com/nf-core/chrmtags
    Website: https://nf-co.re/chrmtags
    Slack  : https://nfcore.slack.com/channels/chrmtags
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

include { CHRMTAGS } from './workflows/chrmtags'

//
// WORKFLOW: Run main nf-core/chrmtags analysis pipeline
//
workflow NFCORE_CHRMTAGS {
    CHRMTAGS ()
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
    NFCORE_CHRMTAGS ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
