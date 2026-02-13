process MSFRAGGER_CURTAINPTM_CONVERTER {
    label 'process_medium'

    container "${ workflow.containerEngine == 'singularity' ?
        'docker://cauldron/msfragger-curtainptm-converter:1.0.0' :
        'cauldron/msfragger-curtainptm-converter:1.0.0' }"

    input:
    path input_file
    val index_col
    val peptide_col
    path fasta_file
    val get_position_from_peptide
    val uniprot_columns
    val output_filename
    val sequence_window_size

    output:
    
    path "*.txt", emit: converted_file, optional: true
    path "versions.yml", emit: versions

    script:
    def args = task.ext.args ?: ''
    """
    # Build arguments dynamically to match CauldronGO PluginExecutor logic
    ARG_LIST=()

    
    python /app/convert.py \
        "\${ARG_LIST[@]}" \
        --output_folder . \
        \${args:-}

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        MSFragger to CurtainPTM Converter: 1.0.0
    END_VERSIONS
    """
}
