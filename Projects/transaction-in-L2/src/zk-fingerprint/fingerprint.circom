pragma circom 2.0.0;

include "circomlib/poseidon.circom";

template FingerprintVerifier() {
    // Private input: fingerprint value (could be numeric or encoded features)
    signal input fingerprint;

    // Public input: expected hashed value
    signal input expectedHash;

    // Use Poseidon hash function (ZK-friendly)
    component hash = Poseidon(1);

    // Connect fingerprint to Poseidon input
    hash.inputs[0] <== fingerprint;

    // Constraint: hash(fingerprint) == expectedHash
    expectedHash === hash.out;
    
    // Output the result (for debugging)
    signal output out;
    out <== hash.out;
}

component main = FingerprintVerifier();
