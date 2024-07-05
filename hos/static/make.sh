#!/bin/sh

[ -d "pdfs" ] || mkdir -v "pdfs"

[ $# -gt 0 ] && ./asciidoc-tor.rb -i ../content/notes/k8s-ingress-loadbalancer.adoc -o _test.pdf && exit 0

adoc2pdf() {
    if [ $# -eq 2 ]; then
        inputfile="../content/${1}/${2}"
        outputdir="pdfs/${1}"
        outputfile="$(echo pdfs/${1}/${2} | sed 's/adoc$/pdf/')"

        [ -d ${outputdir} ] || mkdir -v ${outputdir}

        # printf '[input]: %s\n[output]: %s\n' ${inputfile} ${outputfile}
    else
        inputfile="../content/${1}/${2}/${3}"
        outputdir1="pdfs/${1}"
        outputdir2="pdfs/${1}/${2}"
        outputfile="$(echo pdfs/${1}/${2}/${3} | sed 's/adoc$/pdf/')"

        [ -d ${outputdir1} ] || mkdir -v ${outputdir1}
        [ -d ${outputdir2} ] || mkdir -v ${outputdir2}

        # printf '[input]: %s\n[output]: %s\n' ${inputfile} ${outputfile}
    fi

    echo "${inputfile} -> ${outputfile}"
    ./asciidoc-tor.rb -i ${inputfile} -o ${outputfile}
}

for root_dir in $(find ../content/ -mindepth 1 -maxdepth 1 -type d | grep -v _ | grep -v about | grep -v welcome); do
    rootdir="$(echo ${root_dir} | awk -F '/' '{print $NF;}')"
    # echo ${rootdir}

    for base_dir in $(find ${root_dir} -mindepth 1 -maxdepth 1 | grep -v _); do
        basename="$(echo ${base_dir} | awk -F '/' '{print $NF;}')"

        if [ -f "${base_dir}" ]; then
            # printf '\t%s\n' ${basename}
            adoc2pdf ${rootdir} ${basename}
        else
            # printf '\t%s\n' ${basename}
            for file_name in $(find ${root_dir}/${basename} -mindepth 1 -maxdepth 1 -name '*.adoc' | grep -v _); do
                filename="$(echo ${file_name} | awk -F '/' '{print $NF;}')"
                # printf '\t\t%s\n' ${filename}
                adoc2pdf ${rootdir} ${basename} ${filename}
            done
        fi

    done


done

