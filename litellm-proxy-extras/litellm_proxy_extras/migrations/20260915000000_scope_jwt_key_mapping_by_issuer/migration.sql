-- AlterTable
ALTER TABLE "LiteLLM_JWTKeyMapping" ADD COLUMN IF NOT EXISTS "jwt_issuer" TEXT;

-- DropIndex
DROP INDEX IF EXISTS "LiteLLM_JWTKeyMapping_jwt_claim_name_jwt_claim_value_key";

-- DropIndex
DROP INDEX IF EXISTS "LiteLLM_JWTKeyMapping_jwt_claim_name_jwt_claim_value_is_act_idx";

-- CreateIndex
CREATE UNIQUE INDEX IF NOT EXISTS "LiteLLM_JWTKeyMapping_jwt_issuer_jwt_claim_name_jwt_claim__key" ON "LiteLLM_JWTKeyMapping"("jwt_issuer", "jwt_claim_name", "jwt_claim_value");

-- CreateIndex
CREATE INDEX IF NOT EXISTS "LiteLLM_JWTKeyMapping_jwt_issuer_jwt_claim_name_jwt_claim__idx" ON "LiteLLM_JWTKeyMapping"("jwt_issuer", "jwt_claim_name", "jwt_claim_value", "is_active");
