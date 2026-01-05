# MSFragger to CurtainPTM Converter


## Installation

**[⬇️ Click here to install in Cauldron](http://localhost:50060/install?repo=https%3A%2F%2Fgithub.com%2Fnoatgnu%2Fmsfragger-curtainptm-converter-plugin)** _(requires Cauldron to be running)_

> **Repository**: `https://github.com/noatgnu/msfragger-curtainptm-converter-plugin`

**Manual installation:**

1. Open Cauldron
2. Go to **Plugins** → **Install from Repository**
3. Paste: `https://github.com/noatgnu/msfragger-curtainptm-converter-plugin`
4. Click **Install**

**ID**: `msfragger-curtainptm-converter`  
**Version**: 1.0.0  
**Category**: utilities  
**Author**: CauldronGO Team

## Description

Convert MSFragger PTM single site output to CurtainPTM upload format. Extracts PTM positions from index columns, maps peptide sequences to proteins, and generates sequence windows around modification sites. Based on: Phung et al. (2024) PNAS 121(7):e2312676121. Repository: https://github.com/noatgnu/curtain-utils

## Runtime

- **Environments**: `python`

- **Entrypoint**: `convert.py`

## Inputs

| Name | Label | Type | Required | Default | Visibility |
|------|-------|------|----------|---------|------------|
| `input_file` | MSFragger Output File | file | Yes | - | Always visible |
| `index_col` | Index Column Name | text | Yes | Index | Always visible |
| `peptide_col` | Peptide Column Name | text | Yes | Peptide | Always visible |
| `fasta_file` | FASTA File (Optional) | file | No | - | Always visible |
| `get_position_from_peptide` | Parse Position from Peptide Column | boolean | No | false | Always visible |
| `uniprot_columns` | UniProt Data Columns | text | No | accession,id,sequence,protein_name | Always visible |
| `output_filename` | Output Filename | text | No | curtainptm_input.txt | Always visible |
| `sequence_window_size` | Sequence Window Size | number (min: 1, max: 101, step: 2) | No | 21 | Always visible |

### Input Details

#### MSFragger Output File (`input_file`)

MSFragger PTM output file containing differential analysis with site information in the Index column


#### Index Column Name (`index_col`)

Column name containing site information with accession ID and PTM position (e.g., P12345_S123)

- **Placeholder**: `Index`

#### Peptide Column Name (`peptide_col`)

Column name containing peptide sequences

- **Placeholder**: `Peptide`

#### FASTA File (Optional) (`fasta_file`)

Protein sequence FASTA file. If not provided, sequences will be fetched from UniProt automatically.


#### Parse Position from Peptide Column (`get_position_from_peptide`)

Enable this to extract PTM position from lowercase residues in the peptide sequence instead of the index column


#### UniProt Data Columns (`uniprot_columns`)

Comma-separated list of UniProt columns to retrieve when fetching sequences online

- **Placeholder**: `accession,id,sequence,protein_name`

#### Output Filename (`output_filename`)

Name of the output file (will be created in the output folder)

- **Placeholder**: `curtainptm_input.txt`

#### Sequence Window Size (`sequence_window_size`)

Size of the sequence window around modification sites (must be odd number). Default is 21 (10 residues before + modification + 10 after).


## Outputs

| Name | File | Type | Format | Description |
|------|------|------|--------|-------------|
| `converted_file` | `*.txt` | data | tsv | Converted file in CurtainPTM upload format with PTM positions, sequence windows, and protein annotations |

## Requirements

- **Python Version**: >=3.10

### Python Dependencies (External File)

Dependencies are defined in: `requirements.txt`

- `curtainutils>=0.1.24`
- `pandas>=2.0.0`
- `click>=8.0.0`

> **Note**: When you create a custom environment for this plugin, these dependencies will be automatically installed.

## Usage

### Via UI

1. Navigate to **utilities** → **MSFragger to CurtainPTM Converter**
2. Fill in the required inputs
3. Click **Run Analysis**

### Via Plugin System

```typescript
const jobId = await pluginService.executePlugin('msfragger-curtainptm-converter', {
  // Add parameters here
});
```
