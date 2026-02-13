#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { MSFRAGGER_CURTAINPTM_CONVERTER } from './modules/local/msfragger-curtainptm-converter/main'

workflow PIPELINE {
    main:
    MSFRAGGER_CURTAINPTM_CONVERTER (
        params.input_file ? Channel.fromPath(params.input_file).collect() : Channel.of([]),
        Channel.value(params.index_col ?: ''),
        Channel.value(params.peptide_col ?: ''),
        params.fasta_file ? Channel.fromPath(params.fasta_file).collect() : Channel.of([]),
        Channel.value(params.get_position_from_peptide ?: ''),
        Channel.value(params.uniprot_columns ?: ''),
        Channel.value(params.output_filename ?: ''),
        Channel.value(params.sequence_window_size ?: ''),
    )
}

workflow {
    PIPELINE ()
}
