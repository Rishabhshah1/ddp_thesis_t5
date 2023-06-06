#@title Make predictions
from transformers import T5ForConditionalGeneration
from t5chem import SimpleTokenizer

model_path = "/scratch/scratch1/rishabh/t5chem/model_mit_complete_simple_wopretrain/"
input_seq = "C1CCOC1.N#Cc1ccsc1N.O=[N+]([O-])c1cc(F)c(F)cc1F.[H-].[Na+]>>"
beam_size = 10
num_seq = 5
model = T5ForConditionalGeneration.from_pretrained(model_path)

# from transformers import PreTrainedTokenizerFast
# tokenizer = PreTrainedTokenizerFast(tokenizer_file="/scratch/scratch1/rishabh/t5chem/tokenizer_bpe.json")
tokenizer = SimpleTokenizer(vocab_file='/scratch/scratch1/rishabh/t5chem/model_mit_complete_simple_wopretrain/vocab.pt')
inputs = tokenizer.encode(input_seq, return_tensors='pt')
outputs = model.generate(input_ids=inputs, max_length=300, early_stopping=True, num_beams=beam_size, num_return_sequences=num_seq)
print("Model input:", input_seq)
for i, pred in enumerate(outputs):
  print("Prediction", str(i+1)+":", tokenizer.decode(pred, skip_special_tokens=True))