# Reference genome

This analysis needs a mitochondial reference. We'll use the [Cambridge
Reference](http://en.wikipedia.org/wiki/Cambridge_Reference_Sequence).

* "step1.get_Mt_reference.sh" gets one and replaces the name of the contig for
something that will not confuse Strelka.

* "step2.Index_reference.sh" index the reference file to preapair for the aling process