import vcf
import argparse

parser = argparse.ArgumentParser(description='Creates a table of findings of variants in samples')
parser.add_argument("vcf", type=argparse.FileType('r'), help='a multisample vcf file')
args = parser.parse_args()

r = vcf.Reader(args.vcf)

for v in r:
    d = set()
    for s in v.samples:
        if s.called:
            d.add(s.sample[0])
    print "%s\t%s\t%s\t%s\t%s\t%s\t%s" %(v.CHROM, v.POS, "|".join(d), v.REF, v.ALT, v.INFO["CSQ"][0].split("|")[3], v.INFO["CSQ"][0].split("|")[4])  