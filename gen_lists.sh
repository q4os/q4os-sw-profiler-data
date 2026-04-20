#!/bin/sh

WKDIR1='/tmp/zz_profiler_data_3centaurus'
rm -rf $WKDIR1
mkdir -p $WKDIR1

cd data/q4os_swprofiler
for FLE1 in *.qdprrc; do
  echo "Processing: $FLE1"
  cat "$FLE1" | sed -z 's/\\\n//g' | sed 's/\\\n//g' | tr -s ' ' > "$WKDIR1/.wkfl_1.tmp" #remove all "\" + "\n" + simplify whitespaces
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_laptop" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_trinity" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_plasma" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_lxqt" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_xfce" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_lxde" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_mate" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_cinnamon" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_gnome" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_amd64" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_i386" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_arm64" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  kreadconfig --file "$WKDIR1/.wkfl_1.tmp" --group "General" --key "packages_base_armhf" | tr ' ' '\n' >> "$WKDIR1/.wkfl_2.tmp"
  cat "$WKDIR1/.wkfl_2.tmp" | grep -v "^$" | grep -v "^::" | sort > "$WKDIR1/$FLE1.list"
  rm $WKDIR1/.wkfl_1.tmp $WKDIR1/.wkfl_2.tmp
done
