FROM ufaldsg/pykaldi2-cloudasr
MAINTAINER Lukas Zilka

WORKDIR /opt/app
RUN (mkdir /model; cd /model; wget https://vystadial.ms.mff.cuni.cz/tmp_zilka/nnet_model_cs_voip.zip -O model.zip; unzip model.zip)
RUN (wget -O /model/vad.tffnn https://vystadial.ms.mff.cuni.cz/download/alex/resources/vad/voip/vad_nnt_1196_hu512_hl1_hla3_pf30_nf15_acf_4.0_mfr32000000_mfl1000000_mfps0_ts0_usec00_usedelta0_useacc0_mbo1_bs1000.tffnn)

ENV model cs-nnet-voip

CMD ( while true; do python run.py; done )