# Petra Encryption Guide

This guide explains how Petra files are encrypted and how to manage customer access.

## Overview

- All `petra/` content is encrypted using git-crypt
- Only public files (README.md, .gitattributes) are visible without a key

## For Customers: Accessing Petra

### If You Have a Key

```bash
# Clone the repo
git clone https://github.com/your-org/petra-repo

# Unlock encrypted files
git crypt unlock

# Now access petra/ normally
```

### Requesting Access

Contact the seller to be added as a collaborator.

---

## For Sellers: Adding Customers

This is a one-time process per customer.

### Step 1: Get Their GPG Key

Ask customer to send their GPG public key, or they can export it:

```bash
# They run this locally
gpg --export --armor their@email.com > key.asc
```

### Step 2: Add Key to Repo

```bash
git crypt add-gpg-user customer@email.com
```

### Step 3: Commit and Push

```bash
git commit -m "Add customer access"
git push
```

### Step 4: Notify Customer

Notify customer they now have access and should run:

```bash
git crypt unlock
```

---

## Revoking Access

To revoke access for a customer, you cannot fully remove their key from history. Instead:

1. Create a new repo (recommended), OR
2. Rotate the master key (complex)

For most cases, simply moving to a new repo with only active customers is simpler.

---

## Adding More Encrypted Files

New files in `petra/` are automatically encrypted. Just add and commit normally:

```bash
git add petra/new-file.md
git commit -m "Add new file"
```

---

## Checking Status

```bash
git crypt status          # Shows what's encrypted
git crypt status --ex    # Shows encrypted files
```