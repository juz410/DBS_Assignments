
-- -- Step 1 --
create master key encryption by password ='QwErTy12345!@#$%'

go
select * from sys.symmetric_keys

-- Step 2- Create Certificate 

Create Certificate Cert1 with Subject = 'Cert1'
go
select * from sys.certificates

--Step 3 - Create symmetric key

Create Symmetric Key SymKey1 with Algorithm = AES_256
Encryption by Certificate Cert1


--add database lvl encryption
