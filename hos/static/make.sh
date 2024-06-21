#!/bin/sh

adoc2pdf() {
	echo ${1}
	base_dir="pdfs/$(echo ${1} | awk -F '/' '{print $NF;}')"

	if [ ! -d "${base_dir}" ]; then
		mkdir "${base_dir}"
	fi

	for filename in $(find ${1} -type f); do
		output="${base_dir}/$(echo ${filename} | awk -F '/' '{print $NF;}' | sed 's/adoc$/pdf/')"
		printf "\t${filename} -> ${output}\n"
		ruby asciidoc-tor.rb -i ${filename} -o ${output}
	done
}

for tmp in $(find ../content/ -mindepth 1 -type d); do
	for root_dir in $(find ${tmp} -mindepth 1 -type d -type d | grep -v _ | grep -v asciidoc | grep -v time); do
		adoc2pdf ${root_dir}
	done
done
