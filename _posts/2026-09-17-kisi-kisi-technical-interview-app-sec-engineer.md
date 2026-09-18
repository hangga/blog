---
id: 20240720
title: 'Kisi-Kisi Lengkap Technical Interview Application Security Engineer'
date: '2026-09-17T00:32:24+00:00'
author: 'Hangga Aji Sayekti'
layout: post
image: /wp-content/uploads/2026/09/cyber-security-thumbnail.jpeg
categories:
- Security
tags:
- 'Pentest'
- 'Application Security'
- 'Penetration Testing'
---

Technical interview untuk posisi **Application Security Engineer (AppSec)** biasanya tidak hanya menguji apakah kita hafal OWASP Top 10. Interviewer ingin melihat apakah kita mampu:

* memahami cara kerja aplikasi dari frontend sampai backend,
* menemukan dan menjelaskan vulnerability,
* menilai risiko dan severity,
* membaca source code,
* memahami authentication dan authorization,
* mengamankan API,
* melakukan threat modeling,
* menggunakan security tooling,
* bekerja dengan developer,
* dan menerjemahkan temuan security menjadi perbaikan yang realistis.

Artikel ini dapat digunakan sebagai **roadmap belajar, checklist, sekaligus bank pertanyaan interview**.

---

# 1. Application Security Fundamentals

### Pertanyaan dasar

**1. Apa yang dimaksud dengan Application Security?**

Jawaban ideal harus mencakup perlindungan aplikasi dari vulnerability dan abuse sepanjang lifecycle aplikasi, mulai dari design, development, testing, deployment, sampai maintenance.

---

**2. Apa perbedaan Application Security, Cybersecurity, dan Network Security?**

Pahami scope masing-masing.

* Network Security → jaringan dan komunikasi
* Cybersecurity → cakupan keamanan sistem secara luas
* Application Security → keamanan aplikasi, kode, API, dependency, architecture, dan proses development

---

**3. Apa itu vulnerability, threat, risk, exploit, dan impact?**

Jangan mencampur istilah.

Contoh:

> SQL Injection adalah vulnerability.
> Attacker yang mengeksploitasinya merupakan threat actor.
> SQL injection dapat dieksploitasi menggunakan payload tertentu.
> Dampaknya dapat berupa unauthorized database access.

---

**4. Apa perbedaan vulnerability dan security misconfiguration?**

Misalnya:

* vulnerability pada logic authorization,
* tetapi konfigurasi endpoint admin yang terbuka juga dapat menjadi security misconfiguration.

---

**5. Apa prinsip CIA Triad?**

* Confidentiality
* Integrity
* Availability

Berikan contoh dampak masing-masing pada aplikasi.

---

**6. Apa itu defense in depth?**

Jangan hanya mengandalkan satu security control.

Contoh:

```text
Authentication
      ↓
Authorization
      ↓
Input validation
      ↓
Business rule validation
      ↓
Database access control
      ↓
Monitoring
```

---

# 2. Secure SDLC

### Pertanyaan

**7. Apa itu Secure SDLC?**

Jelaskan bagaimana security dimasukkan ke setiap tahap development.

```text
Requirement
    ↓
Design
    ↓
Development
    ↓
Testing
    ↓
Deployment
    ↓
Monitoring
```

---

**8. Apa perbedaan Shift Left Security dan DevSecOps?**

Shift Left berarti security dipertimbangkan lebih awal.

DevSecOps lebih luas: security diintegrasikan ke workflow development dan operations.

---

**9. Bagaimana cara memasukkan security ke CI/CD?**

Contoh:

```text
Developer
   ↓
Pull Request
   ↓
SAST
   ↓
Dependency Scan
   ↓
Secret Scan
   ↓
Unit/Security Tests
   ↓
Build
   ↓
DAST
   ↓
Deploy
```

---

**10. Apakah semua vulnerability harus membuat pipeline gagal?**

Ini pertanyaan yang bagus untuk menguji maturity.

Jawaban tidak seharusnya:

> "Ya, semua vulnerability harus fail."

Pertimbangkan:

* severity,
* exploitability,
* confidence,
* environment,
* business context,
* false positive,
* compensating controls.

---

# 3. OWASP

Kuasai **OWASP Top 10**, tetapi jangan berhenti pada definisinya.

Untuk setiap kategori pahami:

1. cara kerja,
2. contoh vulnerability,
3. cara menemukan,
4. impact,
5. remediation,
6. contoh kode vulnerable,
7. contoh kode secure.

Kategori yang perlu dikuasai antara lain:

* Broken Access Control
* Cryptographic Failures
* Injection
* Insecure Design
* Security Misconfiguration
* Vulnerable and Outdated Components
* Identification and Authentication Failures
* Software and Data Integrity Failures
* Security Logging and Monitoring Failures
* SSRF

---

# 4. Authentication

### Pertanyaan interview

**11. Apa perbedaan authentication dan authorization?**

Authentication:

> Who are you?

Authorization:

> What are you allowed to do?

---

**12. Bagaimana cara mendesain authentication yang aman?**

Bahas:

* password hashing,
* session/token,
* MFA,
* rate limiting,
* account recovery,
* session expiration,
* secure cookies,
* login protection.

---

**13. Apa perbedaan hashing, encryption, dan encoding?**

Ini pertanyaan fundamental.

### Hashing

One-way transformation.

```text
password → hash
```

### Encryption

Reversible menggunakan key.

```text
plaintext → ciphertext → plaintext
```

### Encoding

Representasi data.

```text
"hello" → Base64
```

Base64 bukan encryption.

---

**14. Bagaimana password seharusnya disimpan?**

Jangan:

```text
SHA256(password)
```

Gunakan password hashing algorithm yang memang dirancang untuk password, seperti:

* Argon2id
* bcrypt
* scrypt

Dengan konfigurasi yang sesuai.

---

**15. Apa itu salt?**

Random value yang digunakan bersama password sebelum hashing sehingga password yang sama tidak menghasilkan hash yang sama.

---

**16. Apa itu password pepper?**

Secret tambahan yang tidak disimpan bersama database password.

---

# 5. Session Security

**17. Apa itu session fixation?**

Attacker membuat korban menggunakan session ID yang sudah diketahui attacker.

---

**18. Apa itu session hijacking?**

Attacker memperoleh session credential korban dan menggunakannya untuk impersonation.

---

**19. Apa atribut cookie yang perlu diperhatikan?**

Minimal pahami:

```text
Secure
HttpOnly
SameSite
Domain
Path
```

---

**20. Apa fungsi HttpOnly?**

Mencegah JavaScript mengakses cookie melalui mekanisme seperti:

```javascript
document.cookie
```

Tetapi HttpOnly **tidak mencegah semua bentuk XSS**.

---

# 6. JWT

**21. Apa itu JWT?**

Pahami struktur:

```text
Header.Payload.Signature
```

---

**22. Apakah JWT terenkripsi?**

Tidak secara default.

JWT biasanya encoded, bukan encrypted.

---

**23. Apa vulnerability umum JWT?**

Pahami:

* algorithm confusion,
* weak signing secret,
* improper signature verification,
* accepting unsigned tokens,
* excessive token lifetime,
* token leakage,
* insufficient authorization checks.

---

**24. Apakah JWT selalu lebih baik daripada session?**

Tidak.

Pemilihan tergantung architecture dan kebutuhan.

---

# 7. Authorization dan Access Control

Ini merupakan area yang sangat penting untuk AppSec.

**25. Apa itu Broken Access Control?**

User dapat melakukan action atau mengakses resource yang seharusnya tidak boleh dilakukan.

---

**26. Apa itu IDOR?**

Contoh:

```http
GET /api/users/1001/profile
```

User A mengganti:

```text
1001 → 1002
```

dan dapat melihat data User B.

Masalah sebenarnya bukan sekadar parameter ID.

Masalahnya adalah:

> server tidak memastikan bahwa requester memiliki authorization terhadap resource tersebut.

---

**27. Bagaimana mencegah IDOR?**

Authorization harus dilakukan server-side.

```text
request
   ↓
authenticate user
   ↓
identify resource
   ↓
check authorization
   ↓
allow / deny
```

Jangan hanya mengandalkan:

* hidden field,
* frontend validation,
* disabled button,
* UUID,
* obfuscation.

---

**28. Apakah UUID mencegah IDOR?**

Tidak.

UUID membuat enumeration lebih sulit, tetapi bukan authorization control.

---

**29. Apa perbedaan horizontal dan vertical privilege escalation?**

Horizontal:

```text
User A → User B
```

Vertical:

```text
User → Admin
```

---

**30. Apakah frontend authorization cukup?**

Tidak.

Frontend authorization terutama untuk UX.

Security boundary harus berada di backend.

---

# 8. API Security

Pahami REST API secara mendalam.

### Pertanyaan

**31. Apa security issue yang umum pada REST API?**

Misalnya:

* broken authorization,
* excessive data exposure,
* mass assignment,
* rate-limit bypass,
* injection,
* SSRF,
* improper authentication,
* business logic flaws.

---

**32. Apa itu mass assignment?**

Contoh:

```json
{
  "name": "Alice",
  "role": "admin"
}
```

Jika server secara otomatis menerima semua field dan langsung melakukan binding ke object internal, user mungkin dapat memodifikasi field yang seharusnya tidak boleh diubah.

---

**33. Bagaimana mencegah mass assignment?**

Gunakan explicit allowlist:

```text
Allowed:
name
email

Not allowed:
role
isAdmin
permissions
```

---

**34. Apakah API harus selalu menggunakan POST untuk data sensitif?**

Tidak sesederhana itu.

POST sendiri bukan security control.

Yang penting:

* HTTPS,
* authentication,
* authorization,
* validation,
* appropriate caching policy,
* secure logging,
* proper handling of sensitive data.

---

# 9. Input Validation

**35. Apakah input validation dapat mencegah semua attack?**

Tidak.

Validation harus disesuaikan dengan konteks.

---

**36. Apa perbedaan allowlist dan blocklist?**

Allowlist:

```text
hanya menerima format yang diperbolehkan
```

Blocklist:

```text
menolak beberapa pola yang diketahui berbahaya
```

Allowlist biasanya lebih robust ketika memungkinkan.

---

**37. Di mana validation harus dilakukan?**

Frontend validation berguna untuk UX.

Backend validation wajib karena client tidak trusted.

---

# 10. SQL Injection

Pahami:

```sql
SELECT * FROM users
WHERE username = '$username'
```

Jika input dimasukkan langsung ke query, attacker dapat memanipulasi query.

---

**38. Bagaimana mencegah SQL Injection?**

Gunakan parameterized query / prepared statement.

Bukan:

```text
string concatenation
```

---

**39. Apakah ORM otomatis mencegah SQL Injection?**

Tidak selalu.

Raw query dan dynamic SQL tetap dapat rentan.

---

# 11. XSS

Pahami tiga jenis utama:

* Reflected XSS
* Stored XSS
* DOM-based XSS

---

**40. Apa perbedaan XSS dan CSRF?**

XSS:

> attacker menjalankan script dalam security context aplikasi.

CSRF:

> attacker memaksa browser korban melakukan request yang korban berwenang lakukan.

---

**41. Apakah HttpOnly mencegah XSS?**

Tidak.

HttpOnly membantu melindungi cookie dari pembacaan JavaScript, tetapi tidak menghilangkan vulnerability XSS.

---

**42. Bagaimana mencegah XSS?**

Tergantung context:

* output encoding,
* contextual escaping,
* safe DOM APIs,
* sanitization,
* Content Security Policy,
* avoiding dangerous HTML injection.

---

# 12. CSRF

**43. Bagaimana CSRF terjadi?**

Contoh:

```text
Victim login ke bank
       ↓
Victim membuka malicious website
       ↓
Browser mengirim request ke bank
       ↓
Session cookie ikut terkirim
```

---

**44. Cara mencegah CSRF?**

Pahami:

* CSRF token,
* SameSite cookie,
* Origin checking,
* Referer validation sebagai defense tertentu.

---

# 13. SSRF

**45. Apa itu SSRF?**

Server melakukan request ke destination yang dikontrol attacker.

Contoh:

```text
POST /fetch

url=https://attacker.example
```

---

**46. Mengapa SSRF berbahaya?**

Server mungkin memiliki akses ke resource yang tidak dapat diakses attacker secara langsung.

Misalnya:

```text
Internet
   ↓
Application Server
   ↓
Internal Service
```

---

**47. Bagaimana mitigasi SSRF?**

Bahas:

* destination allowlist,
* URL parsing yang benar,
* IP validation,
* DNS rebinding protection,
* network egress controls,
* metadata endpoint protection,
* redirect handling.

Jangan hanya mengatakan:

> "Block localhost."

Karena SSRF dapat menggunakan representasi IP dan teknik lain.

---

# 14. Business Logic Vulnerability

Ini area yang sering membedakan AppSec engineer berpengalaman dengan scanner operator.

### Pertanyaan

**48. Apa itu business logic vulnerability?**

Vulnerability yang muncul karena aplikasi mengimplementasikan business rule secara tidak aman.

Contoh:

```text
Harga = 100
Quantity = -1

Total = -100
```

Jika sistem menerima quantity negatif, logic pembayaran dapat disalahgunakan.

---

**49. Mengapa business logic bug sulit ditemukan SAST/DAST?**

Karena scanner tidak selalu memahami:

* business rules,
* intended workflow,
* user roles,
* state transitions,
* economic assumptions.

---

**50. Bagaimana cara menemukan business logic flaw?**

Pahami workflow.

Contoh:

```text
Create order
    ↓
Apply coupon
    ↓
Calculate price
    ↓
Pay
    ↓
Confirm order
```

Kemudian tanyakan:

* apakah step dapat dilewati?
* dapat diulang?
* dapat dilakukan out of order?
* dapat dilakukan dengan user berbeda?
* apakah state dapat dimanipulasi?

---

# 15. Race Condition

**51. Apa itu race condition?**

Dua atau lebih request memproses state yang sama secara bersamaan sehingga menghasilkan keadaan yang tidak semestinya.

Contoh:

```text
Balance = $100

Request A → withdraw $100
Request B → withdraw $100

Keduanya membaca balance = $100
```

---

**52. Bagaimana mencegah race condition?**

Tergantung sistem:

* transaction,
* locking,
* atomic operation,
* optimistic concurrency,
* unique constraint,
* idempotency.

---

# 16. Cryptography

Pahami konsep:

* symmetric encryption,
* asymmetric encryption,
* hashing,
* MAC,
* digital signature,
* key management,
* random number generation.

### Pertanyaan

**53. AES vs RSA?**

AES:

* symmetric
* cepat
* membutuhkan shared secret

RSA:

* asymmetric
* public/private key
* relatif lebih mahal

---

**54. Apa itu encryption at rest dan encryption in transit?**

At rest:

```text
database / disk / backup
```

In transit:

```text
client ↔ server
```

Biasanya menggunakan TLS untuk komunikasi jaringan.

---

**55. Apa kesalahan cryptography yang umum?**

* hardcoded keys,
* weak random,
* obsolete algorithms,
* improper key management,
* reuse nonce/IV pada kondisi yang tidak boleh,
* custom cryptography.

---

# 17. Secrets Management

**56. Apakah API key di frontend selalu secret?**

Tidak.

Jika aplikasi memang harus mengirim credential ke browser, credential tersebut pada praktiknya dapat dilihat user.

Pertanyaan yang lebih penting:

> Apa privilege credential tersebut?

---

**57. Bagaimana mengelola secret?**

Hindari:

```text
Git repository
source code
Docker image
frontend bundle
logs
```

Gunakan secret-management mechanism yang sesuai.

---

**58. Bagaimana menangani secret yang terlanjur masuk Git?**

Jangan hanya menghapus file.

Lakukan:

1. revoke/rotate credential,
2. remove dari source,
3. audit usage,
4. clean history jika diperlukan,
5. tambahkan secret scanning.

---

# 18. Dependency Security

**59. Bagaimana menangani vulnerable dependency?**

Jangan otomatis:

> "Update semuanya."

Evaluasi:

* affected version,
* exploitability,
* reachable code,
* application exposure,
* available patch,
* breaking changes,
* compensating controls.

---

**60. Apa itu SCA?**

Software Composition Analysis.

Digunakan untuk mendeteksi:

* vulnerable dependencies,
* license issues,
* dependency inventory,
* transitive dependencies.

---

# 19. SAST, DAST, IAST

Pahami perbedaannya.

| Tool           | Fokus                                 |
| -------------- | ------------------------------------- |
| SAST           | Source/code                           |
| DAST           | Running application                   |
| IAST           | Application runtime + instrumentation |
| SCA            | Dependencies                          |
| Secret Scanner | Credentials/secrets                   |

---

**61. Apakah SAST dapat menemukan semua vulnerability?**

Tidak.

Terutama sulit untuk:

* business logic,
* authorization context,
* runtime configuration,
* complex distributed behavior.

---

**62. Apakah DAST dapat menemukan semua vulnerability?**

Tidak.

DAST memiliki keterbatasan pada:

* authenticated flows,
* business logic,
* unreachable endpoints,
* complex workflows,
* source-level issues.

---

# 20. Threat Modeling

**63. Apa itu threat modeling?**

Proses sistematis untuk mengidentifikasi:

* assets,
* trust boundaries,
* threats,
* attack surfaces,
* mitigations.

---

**64. Apa itu STRIDE?**

* Spoofing
* Tampering
* Repudiation
* Information Disclosure
* Denial of Service
* Elevation of Privilege

---

**65. Bagaimana melakukan threat modeling API?**

Mulai dari:

```text
User
 ↓
Frontend
 ↓
API Gateway
 ↓
Application
 ↓
Database
 ↓
Third-party service
```

Identifikasi:

* trust boundary,
* authentication,
* authorization,
* sensitive data,
* privileged operations,
* external dependencies.

---

# 21. Secure Code Review

**66. Apa yang Anda cari ketika melakukan code review security?**

Checklist:

```text
Authentication
Authorization
Input validation
Output encoding
Secrets
Cryptography
Error handling
Logging
File handling
Database access
SSRF
Deserialization
Concurrency
Business logic
```

---

**67. Bagaimana Anda memprioritaskan code review?**

Fokus dahulu pada:

* authentication,
* authorization,
* sensitive data,
* privileged operations,
* external input,
* cryptographic operations,
* payment/business logic.

---

# 22. File Upload

**68. Apa risiko file upload?**

* malicious file,
* executable upload,
* path traversal,
* MIME confusion,
* parser vulnerability,
* stored XSS,
* oversized file / DoS.

---

**69. Apakah cukup memeriksa extension?**

Tidak.

Pertimbangkan:

* allowlist extension,
* MIME/content validation,
* file signature,
* filename normalization,
* storage isolation,
* size limits,
* malware scanning sesuai kebutuhan.

---

# 23. Path Traversal

Contoh:

```text
GET /download?file=../../etc/passwd
```

Pahami:

* canonicalization,
* path normalization,
* allowlist,
* sandbox/storage boundary.

Jangan hanya melakukan string replacement:

```text
../ → ""
```

---

# 24. Deserialization

**70. Apa itu insecure deserialization?**

Aplikasi menerima serialized object dari sumber yang tidak dipercaya dan memprosesnya secara unsafe.

Dampak dapat mencakup:

* privilege manipulation,
* data tampering,
* denial of service,
* bahkan remote code execution pada teknologi tertentu.

---

# 25. Security Headers

Kenali:

```text
Content-Security-Policy
Strict-Transport-Security
X-Content-Type-Options
Referrer-Policy
Permissions-Policy
```

Pahami fungsi dan trade-off masing-masing.

---

# 26. TLS

**71. Apakah HTTPS berarti aplikasi aman?**

Tidak.

HTTPS terutama melindungi komunikasi dari interception/tampering pada jalur komunikasi.

Aplikasi tetap dapat memiliki:

* IDOR,
* SQL Injection,
* XSS,
* business logic flaw,
* authentication flaw.

---

# 27. Logging dan Monitoring

**72. Apa yang harus dicatat?**

Contohnya:

* authentication events,
* authorization failures,
* suspicious requests,
* privilege changes,
* sensitive operations,
* security events.

---

**73. Apa yang tidak boleh dimasukkan ke log?**

Hindari credential dan data sensitif yang tidak diperlukan.

Contoh:

```text
password
session token
API secret
private key
```

---

# 28. Vulnerability Assessment

**74. Bagaimana Anda memvalidasi vulnerability?**

Workflow:

```text
Finding
 ↓
Reproduce
 ↓
Understand root cause
 ↓
Determine affected scope
 ↓
Determine impact
 ↓
Determine exploitability
 ↓
Assign severity
 ↓
Recommend remediation
```

---

**75. Apa yang membuat vulnerability menjadi high severity?**

Jangan hanya melihat nama vulnerability.

Pertimbangkan:

* impact,
* exploitability,
* privileges required,
* attack complexity,
* user interaction,
* exposure,
* business context.

---

# 29. CVSS

Pahami konsep CVSS:

* Attack Vector
* Attack Complexity
* Attack Requirements
* Privileges Required
* User Interaction
* Confidentiality
* Integrity
* Availability

Jangan menganggap:

```text
CVSS score = business risk
```

CVSS adalah salah satu input dalam risk assessment.

---

# 30. False Positive

**76. Apa itu false positive?**

Tool melaporkan vulnerability yang sebenarnya tidak exploitable atau tidak berlaku dalam konteks aplikasi.

---

**77. Bagaimana menangani false positive?**

Validasi manual.

Jangan:

> "Scanner bilang critical, jadi critical."

---

# 31. Incident Response

**78. Apa yang Anda lakukan jika menemukan vulnerability critical di production?**

Contoh pendekatan:

```text
Validate
 ↓
Assess exposure
 ↓
Contain
 ↓
Notify stakeholders
 ↓
Remediate
 ↓
Verify fix
 ↓
Monitor
 ↓
Document
```

---

# 32. Secure Architecture

Interview dapat memberikan skenario:

> "Kami memiliki frontend, API, database, Redis, dan third-party payment provider. Bagaimana Anda mengamankannya?"

Bahas:

* trust boundaries,
* authentication,
* authorization,
* network segmentation,
* secret management,
* encryption,
* least privilege,
* validation,
* monitoring,
* failure modes.

---

# 33. Cloud Security untuk AppSec

Pahami konsep:

* IAM
* least privilege
* security groups
* object storage permissions
* metadata services
* secrets management
* KMS
* logging
* container security
* serverless security.

Pertanyaan contoh:

> Bagaimana SSRF pada cloud environment dapat menjadi lebih serius?

Jawab dengan menjelaskan bahwa server yang berhasil dipaksa melakukan request internal mungkin memiliki akses ke internal services atau metadata service, tergantung konfigurasi platform.

---

# 34. Container Security

Pahami:

```text
Dockerfile
 ↓
Image
 ↓
Registry
 ↓
Runtime
```

Security concern:

* vulnerable base image,
* running as root,
* embedded secrets,
* excessive privileges,
* unnecessary packages,
* exposed ports,
* image provenance.

---

# 35. Kubernetes Security

Minimal pahami:

* RBAC,
* ServiceAccount,
* Secrets,
* NetworkPolicy,
* Pod Security,
* admission control,
* container privileges,
* API server exposure.

---

# 36. Security Testing

Interviewer bisa bertanya:

> "Bagaimana Anda menguji endpoint berikut?"

```http
POST /api/orders
```

Jawaban jangan hanya:

> "Saya scan dengan Burp Suite."

Buat methodology:

```text
Understand endpoint
 ↓
Authentication testing
 ↓
Authorization testing
 ↓
Input validation
 ↓
Business logic
 ↓
Parameter manipulation
 ↓
Race condition
 ↓
Rate limiting
 ↓
Error handling
 ↓
Data exposure
```

---

# 37. Burp Suite

Jika diminta menjelaskan workflow:

```text
Proxy
 ↓
Target mapping
 ↓
Request inspection
 ↓
Repeater
 ↓
Intruder
 ↓
Authorization testing
 ↓
Automation/scanning
 ↓
Manual validation
```

Pahami juga mengapa **Repeater** sering sangat penting untuk AppSec testing manual.

---

# 38. Scenario-Based Interview

Pertanyaan scenario biasanya lebih penting daripada hafalan definisi.

### Skenario 1

> User biasa dapat mengakses `/admin/users`.

Apa yang Anda lakukan?

Jawaban harus membahas:

1. reproduce,
2. authentication state,
3. authorization check,
4. HTTP method,
5. object/action,
6. impact,
7. remediation.

---

### Skenario 2

> API mengembalikan 200 tetapi frontend menyembunyikan data.

Apakah aman?

Tidak otomatis.

Frontend bukan security boundary.

---

### Skenario 3

> Endpoint menggunakan UUID sehingga IDOR dianggap mustahil.

Bagaimana respons Anda?

UUID bukan authorization mechanism.

Test apakah user A dapat mengakses UUID milik user B.

---

### Skenario 4

> Scanner menemukan SQL Injection tetapi developer mengatakan ORM sudah digunakan.

Apa yang dilakukan?

Inspect implementation.

Cari:

* raw SQL,
* string concatenation,
* dynamic query,
* unsafe query construction.

---

### Skenario 5

> Developer mengatakan vulnerability hanya bisa dieksploitasi oleh authenticated user.

Apakah otomatis low severity?

Tidak.

Authenticated attacker tetap dapat memiliki impact besar.

---

# 39. Secure Design Questions

Contoh pertanyaan:

> "Design authentication untuk aplikasi banking."

Bahas:

```text
Login
 ↓
MFA
 ↓
Session/token
 ↓
Authorization
 ↓
Sensitive transaction verification
 ↓
Audit logging
 ↓
Monitoring
```

Jangan hanya fokus pada login.

Security harus mencakup seluruh transaction lifecycle.

---

# 40. Coding Questions

AppSec Engineer kadang diminta membaca atau memperbaiki kode.

Contoh:

```java
String query =
    "SELECT * FROM users WHERE id = " + userId;
```

Pertanyaan:

> Apa masalahnya?

Jawaban:

SQL Injection jika `userId` berasal dari input tidak terpercaya.

---

Contoh:

```java
if (user.isAdmin()) {
    showAdminPanel();
}
```

Pertanyaan:

> Apakah ini cukup untuk authorization?

Belum tentu.

Harus dipastikan **server-side authorization dilakukan pada setiap privileged operation**, bukan sekadar menyembunyikan UI.

---

# 41. Pertanyaan tentang Security Mindset

Interviewer sering memberikan pertanyaan seperti:

> "Apa hal pertama yang Anda lakukan ketika diberikan aplikasi baru?"

Jawaban yang matang:

```text
Understand architecture
        ↓
Identify assets
        ↓
Identify trust boundaries
        ↓
Map attack surface
        ↓
Understand authentication
        ↓
Understand authorization
        ↓
Identify sensitive workflows
        ↓
Test high-risk areas
```

---

# 42. Pertanyaan yang Menguji Pengalaman Nyata

Siapkan jawaban untuk:

### "Ceritakan vulnerability paling menarik yang pernah Anda temukan."

Gunakan format:

```text
Context
 ↓
Observation
 ↓
Hypothesis
 ↓
Testing
 ↓
Root cause
 ↓
Impact
 ↓
Remediation
```

Jangan hanya menceritakan payload.

Yang ingin diketahui interviewer adalah **cara berpikir Anda**.

---

### "Bagaimana Anda menemukan vulnerability tersebut?"

Jelaskan reasoning.

Contoh:

```text
Observed endpoint
        ↓
Noticed object identifier
        ↓
Changed identifier
        ↓
Compared authorization behavior
        ↓
Confirmed cross-user access
```

---

### "Bagaimana Anda menjelaskan vulnerability kepada developer?"

Fokus pada:

* root cause,
* reproducibility,
* impact,
* remediation.

Bukan menyalahkan developer.

---

# 43. Pertanyaan Behavioral yang Tetap Technical

### "Developer tidak setuju dengan finding Anda. Apa yang Anda lakukan?"

Jawaban ideal:

1. reproduce bersama,
2. tunjukkan evidence,
3. jelaskan threat model,
4. diskusikan impact,
5. dengarkan konteks developer,
6. cari remediation yang feasible,
7. dokumentasikan keputusan.

---

### "Mana yang lebih penting: security atau usability?"

Jawaban matang:

> Keduanya harus dipertimbangkan berdasarkan risk dan business context. Security control yang terlalu berat dapat mendorong pengguna atau developer mencari workaround, sementara kontrol yang terlalu lemah dapat menciptakan exposure.

---

# 44. Pertanyaan yang Sering Menjebak

### "Apakah POST aman dari CSRF?"

Tidak.

Method HTTP bukan CSRF protection.

---

### "Apakah HTTPS mencegah SQL Injection?"

Tidak.

---

### "Apakah JWT aman?"

JWT adalah format/token mechanism, bukan jaminan keamanan.

---

### "Apakah UUID mencegah IDOR?"

Tidak.

---

### "Apakah WAF mencegah SQL Injection?"

WAF dapat menjadi defense layer, tetapi bukan pengganti secure coding.

---

### "Apakah encryption membuat data aman?"

Tidak otomatis.

Key management, access control, implementation, dan threat model tetap penting.

---

### "Apakah frontend validation merupakan security control?"

Frontend validation membantu UX, tetapi server harus melakukan validasi dan authorization sendiri.

---

# 45. Pertanyaan Advanced

Untuk level Senior AppSec, siapkan:

### Architecture

* Bagaimana threat modeling microservices?
* Bagaimana mengamankan service-to-service communication?
* Bagaimana menangani authorization lintas service?
* Apa risiko API Gateway?
* Bagaimana mengamankan event-driven architecture?

### Identity

* OAuth 2.0 vs OpenID Connect?
* Access token vs refresh token?
* PKCE?
* Token rotation?
* Session revocation?

### Cloud

* IAM privilege escalation?
* SSRF terhadap cloud metadata?
* Object storage exposure?
* Secrets management?
* Workload identity?

### Supply Chain

* Dependency confusion?
* Typosquatting?
* Malicious package?
* Lockfile?
* SBOM?
* Artifact signing?

### Application Logic

* Race condition?
* Replay attack?
* Idempotency?
* State machine abuse?
* Multi-step authorization bypass?

---

# 46. OAuth 2.0 dan OIDC

Minimal pahami:

```text
User
 ↓
Authorization Server
 ↓
Authorization Code
 ↓
Client
 ↓
Access Token
 ↓
Resource Server
```

Bedakan:

**OAuth 2.0**

Authorization.

**OpenID Connect**

Authentication/identity layer di atas OAuth 2.0.

Pahami juga:

* authorization code,
* PKCE,
* redirect URI,
* state,
* nonce,
* access token,
* refresh token.

---

# 47. Security Testing dalam CI/CD

Salah satu pertanyaan yang sangat mungkin muncul:

> "Bagaimana Anda mencegah vulnerability masuk production?"

Jawaban:

```text
Developer
   ↓
Pre-commit checks
   ↓
Pull Request
   ↓
SAST
   ↓
SCA
   ↓
Secret scanning
   ↓
Security unit tests
   ↓
Build
   ↓
DAST/API testing
   ↓
Deployment
   ↓
Runtime monitoring
```

Tetapi jangan mengklaim bahwa automation menggantikan security engineer.

Automation menangani pola yang dapat diotomatisasi.

Security engineer menangani:

* architecture,
* threat modeling,
* business logic,
* complex authorization,
* manual investigation,
* risk decisions.

---

# 48. Vulnerability Remediation

Interviewer dapat bertanya:

> "Anda menemukan vulnerability. Apa yang Anda berikan kepada developer?"

Report ideal:

```text
Title
Severity
Affected component
Description
Precondition
Steps to reproduce
Evidence
Impact
Root cause
Remediation
References
```

Untuk vulnerability kompleks, tambahkan:

```text
Attack scenario
Affected users
Exploitability
Business impact
Suggested test case
```

---

# 49. Bagaimana Menjawab Technical Interview dengan Baik

Jangan menjawab seperti ensiklopedia.

Gunakan pola:

### Definition

Apa masalahnya?

### Mechanism

Bagaimana terjadi?

### Example

Berikan contoh sederhana.

### Impact

Apa yang dapat dilakukan attacker?

### Mitigation

Bagaimana memperbaikinya?

Contoh:

> "IDOR adalah authorization flaw ketika user dapat mengakses object milik user lain. Biasanya terjadi ketika server menerima object ID tetapi tidak memeriksa ownership atau permission. Misalnya user A mengganti `/orders/1001` menjadi `/orders/1002` dan mendapatkan order user B. Mitigasinya adalah melakukan server-side authorization check terhadap resource tersebut pada setiap request."

Ini jauh lebih kuat daripada sekadar:

> "IDOR adalah Insecure Direct Object Reference."

---

# 50. Checklist Belajar Sebelum Interview

## Fundamental

* [ ] CIA Triad
* [ ] Authentication
* [ ] Authorization
* [ ] Least privilege
* [ ] Defense in depth
* [ ] Trust boundary
* [ ] Attack surface
* [ ] Threat vs vulnerability vs risk

## Web Security

* [ ] XSS
* [ ] CSRF
* [ ] SQL Injection
* [ ] SSRF
* [ ] IDOR
* [ ] CSRF
* [ ] Session attacks
* [ ] Path traversal
* [ ] File upload
* [ ] Deserialization

## Identity

* [ ] Session
* [ ] JWT
* [ ] OAuth 2.0
* [ ] OIDC
* [ ] MFA
* [ ] Password hashing
* [ ] Token lifecycle

## API

* [ ] API authentication
* [ ] Object authorization
* [ ] Function authorization
* [ ] Mass assignment
* [ ] Rate limiting
* [ ] Replay attack
* [ ] API abuse
* [ ] Business logic

## Application

* [ ] Business logic
* [ ] Race condition
* [ ] State machine
* [ ] Transaction security
* [ ] Input validation
* [ ] Output encoding
* [ ] Secure error handling

## Cryptography

* [ ] Hashing
* [ ] Encryption
* [ ] Encoding
* [ ] Symmetric crypto
* [ ] Asymmetric crypto
* [ ] Digital signature
* [ ] Key management
* [ ] Randomness

## DevSecOps

* [ ] SAST
* [ ] DAST
* [ ] IAST
* [ ] SCA
* [ ] Secret scanning
* [ ] Container scanning
* [ ] IaC scanning
* [ ] SBOM
* [ ] CI/CD security

## Cloud

* [ ] IAM
* [ ] Least privilege
* [ ] Secrets
* [ ] KMS
* [ ] Object storage
* [ ] Metadata service
* [ ] Network security
* [ ] Container security
* [ ] Kubernetes security

## Security Process

* [ ] Threat modeling
* [ ] Secure code review
* [ ] Vulnerability management
* [ ] Risk assessment
* [ ] Incident response
* [ ] Security architecture
* [ ] Security awareness
* [ ] Security champions

---

# 51. 20 Pertanyaan yang Paling Layak Dilatih

Jika waktu belajar terbatas, prioritaskan pertanyaan berikut:

1. Apa perbedaan authentication dan authorization?
2. Bagaimana Anda menemukan dan membuktikan IDOR?
3. Bagaimana mencegah broken access control?
4. Mengapa frontend authorization tidak cukup?
5. Bagaimana mencegah SQL Injection?
6. Apa perbedaan XSS dan CSRF?
7. Bagaimana mencegah SSRF?
8. Bagaimana password harus disimpan?
9. Apa risiko JWT?
10. Apa perbedaan OAuth 2.0 dan OIDC?
11. Bagaimana Anda melakukan security code review?
12. Bagaimana melakukan threat modeling?
13. Apa perbedaan SAST, DAST, SCA, dan IAST?
14. Bagaimana security dimasukkan ke CI/CD?
15. Bagaimana menilai severity sebuah vulnerability?
16. Bagaimana menemukan business logic vulnerability?
17. Bagaimana menangani race condition?
18. Bagaimana menangani secret yang bocor ke Git?
19. Bagaimana mengamankan API?
20. Ceritakan vulnerability yang pernah Anda temukan dan bagaimana Anda memvalidasinya.

---

# 52. Level Senior: Jangan Hanya Menjawab "Apa", Jelaskan "Mengapa"

Perbedaan kandidat junior dan senior sering terlihat dari kedalaman reasoning.

Junior mungkin menjawab:

> "Gunakan parameterized query untuk mencegah SQL Injection."

Senior akan mampu menjelaskan:

> "Masalahnya terjadi karena data yang dikontrol user menjadi bagian dari SQL syntax. Parameterized query memisahkan data dari query structure sehingga input tidak diperlakukan sebagai SQL syntax. Tetapi saya juga akan melihat apakah aplikasi menggunakan raw query atau dynamic SQL di bagian lain karena penggunaan ORM tidak otomatis menjamin seluruh application bebas SQL Injection."

Pola berpikir seperti ini yang perlu dilatih.

---

# 53. Framework Berpikir untuk Hampir Semua Skenario Interview

Ketika interviewer memberikan aplikasi atau endpoint yang belum pernah Anda lihat, gunakan urutan:

```text
1. What is the asset?
        ↓
2. Who is the attacker?
        ↓
3. What does the attacker control?
        ↓
4. What trust boundary is crossed?
        ↓
5. What security assumption exists?
        ↓
6. Can I manipulate that assumption?
        ↓
7. What happens if it succeeds?
        ↓
8. How should the application enforce the rule?
```

Ini dapat digunakan untuk menganalisis:

* IDOR,
* privilege escalation,
* SSRF,
* business logic,
* authentication bypass,
* payment abuse,
* race condition,
* API vulnerabilities.

---

# Penutup

Technical interview Application Security Engineer pada akhirnya bukan kompetisi menghafal sebanyak mungkin vulnerability.

Yang perlu terlihat adalah kemampuan untuk berpikir:

```text
Understand the system
        ↓
Identify security boundary
        ↓
Understand attacker control
        ↓
Find broken assumption
        ↓
Prove the vulnerability
        ↓
Understand impact
        ↓
Explain root cause
        ↓
Design practical remediation
        ↓
Verify the fix
```

Jika mampu melakukan alur tersebut, Anda tidak hanya mampu menjawab pertanyaan seperti **"Apa itu IDOR?"**, tetapi juga pertanyaan yang lebih penting:

> **"Saya memberikan aplikasi ini kepada Anda. Apa yang pertama kali Anda cari, mengapa Anda mencarinya, bagaimana Anda membuktikannya, dan bagaimana Anda memperbaikinya?"**

Itulah pola berpikir yang paling penting untuk technical interview AppSec Engineer.
