Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EpM5PKat"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 426Z3x5fwKzF3Tr
 for <openbmc@lists.ozlabs.org>; Sat,  8 Sep 2018 09:52:13 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id i190-v6so7710071pgc.6
 for <openbmc@lists.ozlabs.org>; Fri, 07 Sep 2018 16:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=qBCGOrPo7IPPwIZ/rjvQIPcJdjrhS29h2idzFKuHci0=;
 b=EpM5PKatSBcA5ovkGrBIw8qn887wCnuOij67IZVgB8gIA/Fhjhac2IDb1AI2CBiykq
 YC4h7qxd+xIGW7jjhsbGutxxTzMwpRCtLVhOkECH9GAxKWSuOZ23mlUtwODEMnSvsyRa
 JZq8cF1nwWVjQpNxwJR8Kcl1Xnmg/GB6M3706+XusuCTxnr6voWSrMVtm59oXiiajWuY
 dWATLRu03FdPsYsk0jM6JEjLM7pg5eiLH+7X/WY7gIJYtd650CusQ1CWujdSi3HKCjqM
 3DjmdmbIlHSX22mo9U6W+o3dZF8ghADzS8bq/T2wAzzIyWyo0ma44yrMprqKsQ5iZ1fh
 0Zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
 :content-transfer-encoding;
 bh=qBCGOrPo7IPPwIZ/rjvQIPcJdjrhS29h2idzFKuHci0=;
 b=df2NqTzHXRhyktzroJV5uaBKkLkgYf2s55+B5n8oMxSyNqHMCZtJOAPz2wZ4vhx8uY
 aZBrPDAWjgL7YenYq8HZvB+XWH9O85+V44F1pU0MQ+u/9IYecpJ/upSUIHn0bJN5u8CU
 4K+2W96srTxVoqyB+UBTW8zYV064QK83N7CKzXGdMFdL5Gbb3DuHcbo6SE8DxzcnKcp4
 fr7BvRVwhRDAxR4u59EgCSA8YAHptilc/n1vw3Foytv1zuNMC6FdKl+yO8PYx/E5RaH3
 3+mcylrIk2VlBNnDZF8/gg/+rK2ciaQiX5CPplHoTFA0cg2+AD+2T9Qxd9kVMFEtBLyl
 B3sg==
X-Gm-Message-State: APzg51DDDt6mfEI1ZsFbRjQEx3WA+DtIHCkeh0Sr/cJ0yP5VC1/9ucmD
 n7ouqipeXbiQQxqcvbIVpttCCLBHblz+GOlgWc6kYg==
X-Google-Smtp-Source: ANB0VdbQkxYCqW9uY/WyASG0y0nP/Z9zTMWh0cVWy1mkA6Vun2JRzrd6XxcJl5wA3Y98jWArkIkDUr/8lDSRq4FfmF4=
X-Received: by 2002:a63:3587:: with SMTP id
 c129-v6mr10778229pga.290.1536364330475; 
 Fri, 07 Sep 2018 16:52:10 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 7 Sep 2018 16:51:59 -0700
Message-ID: <CAO=noty5q98Vzhi-cCdf0DtdMFiCrQv8HUor6G8kjDinovrRUg@mail.gmail.com>
Subject: phosphor-ipmi-blobs
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2018 23:52:15 -0000

Brad;

Because we haven't layered a bunch of software on top of this, this is
a great time to send upstream :D  In previous emails, I've discussed
the this design of a BLOB over IPMI interface.  If there is a
phosphor-ipmi-blobs repository, I can push what code base in one
patchset along with the design in markdown.  Here's a paste of the
markdown:

# Phosphor Blob Transfer Interface

This document describes the commands implementing a generic blob transfer
interface. This document does not specify how blobs are stored; that is lef=
t up
to blob-specific implementations. Introduction This mechanism supports read=
ing
and writing from a generic blob store. This mechanism can be leveraged to
support firmware upgrades,

The interface defined in this document supports:

*   Enumerating blobs
*   Opening a blob for reading or writing
*   Writing blob content
*   Committing a blob
*   Polling until the blob has been committed
*   Closing a blob
*   Reading blob content
*   Deleting a blob

Some blobs will only support a subset of these operations. For example, fir=
mware
cannot generally be read, as the firmware file is not persisted on the BMC =
after
it has been activated.

This specification supports IPMI as a transport layer. This can be quite sl=
ow,
however; IPMI transport speeds range from 23 kbps to 256 kbps. LPC/P2A ("PC=
I to
Aspeed") MMIO bridges are currently unsupported. Blob Identifiers Blobs are
identified by NULL-terminated C strings. This protocol supports
implementation-specific blob identifiers; some blobs may have single well-k=
nown
names, while others may be defined only by a prefix, with the client specif=
ying
the rest of the blob name. For example, "/g/bmc_firmware" may represent a s=
ingle
well-known blob that supports BMC firmware updates, whereas "/g/skm/[N]" ma=
y
represent an arbitrary number of SKM keys, with the index specified on the =
host
when opening the blob.

Blob identifiers are limited based on the maximum size of the IPMI packet. =
This
maximum size is platform-dependent; theoretically a packet could be up to 2=
56
bytes, but some hardware only supports packets up to 64 bytes.

If an identifier is malformed, e.g. does not have a trailing NUL-byte or is
otherwise unrecognizable by the BMC, an error is returned.

## Commands

The following details each subcommand in the blob spec. In the following, a=
ny
reference to the command body starts after the 3 bytes of OEM header, the 1=
-byte
subcommand code, and (in the cases where the command body is non-empty) a
two-byte CRC over all data that follows in the body.

All non-empty responses should lead with a two-byte CRC. The CRC algorithm =
is
CRC-16-CCITT (poly 0x1021).

All multi-byte values are encoded as little-endian. All structs are assumed
packed. Success codes are returned via the "completion code" field from the=
 IPMI
spec.

### BmcBlobGetCount (0)

The `BmcBlobGetCount` command expects to receive an empty body. The BMC wil=
l
return the number of enumerable blobs:

```
struct BmcBlobCountRx {
    uint16_t crc16;
    uint32_t blob_count;
};
```

### BmcBlobEnumerate (1)

The `BmcBlobEnumerate` command expects to receive a body of:

```
struct BmcBlobEnumerateTx {
    uint16_t crc16;
    uint32_t blob_idx; /* 0-based index of blob to retrieve. */
};
```

The BMC will return the corresponding blob identifier:

```
struct BmcBlobEnumerateRx {
    uint16_t crc16;
    char     blob_id[];
};
```

Note that the index for a given blob ID is not expected to be stable across=
 a
long term. Callers are expected to call `BmcBlobGetCount`, followed by N ca=
lls
to `BmcBlobEnumerate`, to collect all blob IDs. Callers can then call
`BmcBlobStat` with each blob ID. If this process is interleaved with Open o=
r
Delete calls that modify the number of enumerable blobs, this operation wil=
l be
subject to concurrent modification issues.

### BmcBlobOpen (2)

The BmcBlobOpen command expects to receive a body of:

```
struct BmcBlobOpenTx {
    uint16_t crc16;
    uint16_t flags;
    char     blob_id[]; /* Must correspond to a valid blob. */
};
```

The flags field allows the caller to specify whether the blob is being open=
ed
for reading or writing:

```
enum BmcBlobOpenFlagBits {
    READ =3D 0,
    WRITE =3D 1,
    <bits 2-7 reserved>
    <bits 8-15 given blob-specific definitions>
};
```

If the `WRITE` flag is specified, the BMC will mark the specified blob as "=
open
for writing". Optional blob-specific behavior: if the blob has been open fo=
r
more than one minute without any activity, the existing session will be tor=
n
down and the open will succeed. Alternatively, blobs may allow multiple wri=
te
sessions to be active at once.

The BMC allocates a unique session identifier, and internally maps it to th=
e
blob identifier.

```
struct BmcBlobOpenRx {
    uint16_t crc16;
    uint16_t session_id;
};
```

### BmcBlobRead (3)

The BmcBlobRead command is used to read blob data. It expects to receive a =
body
of:

```
struct BmcBlobReadTx {
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
    uint32_t offset; /* The byte sequence start, 0-based. */
    uint32_t requested_size; /* The number of bytes requested for reading. =
*/
};
```

Blob handlers may require the blob=E2=80=99s "state" to equal `OPEN_R` befo=
re reading is
successful.

```
struct BmcBlobReadRx {
    uint16_t crc16;
    uint8_t  data[];
};
```

Immediately following this structure are the bytes being read. The number o=
f
bytes transferred is the size of the response body less the OEN ("OEM numbe=
r")
(3 bytes), sub-command (1 byte), and the structure size (4 bytes). If no by=
tes
are transferred, the CRC is still sent.

If the BMC cannot return the number of requested bytes, it simply returns t=
he
number of bytes available for reading. If the host tries to read at an inva=
lid
offset or if the host tries to read at the end of the blob, an empty succes=
sful
response is returned; e.g., data is empty.

### BmcBlobWrite (4)

The `BmcBlobWrite` command expects to receive a body of:

```
struct BmcBlobWriteTx {
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
    uint32_t offset; /* The byte sequence start, 0-based. */
    uint8_t  data[];
};
```

Immediately following this structure are the bytes to write. The length of =
the
entire packet is variable and handled at a higher level, therefore the numb=
er of
bytes to write is the size of the command body less the OEN and sub-command=
 (4
bytes) and less the structure size (10 bytes). It is assumed that all write=
s are
sequential, and begin at offset zero.

On success it will return a success completion code.

### BmcBlobCommit (5)

The `BmcBlobCommit` command expects to receive a body of:

```
struct BmcBlobCommitTx {
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
    uint8_t  commit_data_len;
    uint8_t  commit_data[]; /* Optional blob-specific commit data. */
};
```

Each blob defines its own commit behavior. A BMC firmware blob may be verif=
ied
and saved to the filesystem. Commit operations may require additional
data, which
would be provided following the structure in the IPMI packet.

The commit operation may exceed the IPMI timeout duration of ~5 seconds
(implementation dependant). Callers are expected to poll on `BmcBlobSession=
Stat`
or `BmcBlobStat` (as appropriate) until committing has finished. To address=
 race
conditions, blobs should not allow concurrent sessions that modify state.

On success, the BMC returns success completion code.

### BmcBlobClose (6)

The `BmcBlobClose` command must be called after commit-polling has finished=
,
regardless of the result. It expects to receive a body of:

```
struct BmcBlobCloseTx {
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
};
```

The BMC marks the specified blob as closed. On success, the BMC returns a
success completion code.

### BmcBlobDelete (7)

The `BmcBlobDelete` command is used to delete a blob. Not all blobs will su=
pport
deletion. This command expects to receive a body of:

```
struct BmcBlobDeleteTx {
    uint16_t crc16;
    char     blob_id[]; /* Must correspond to a valid blob. */
};
```

If the operation is supported, the blob is deleted. On success, the BMC ret=
urns
a success completion code. This command will fail if there are open session=
s for
the blob.

### BmcBlobStat (8)

The `BmcBlobStat` command is used to retrieve statistics about a blob. Not =
all
blobs must support this command; this is only useful when blob_id semantics=
 are
more useful than session IDs. This command expects to receive a body of:

```
struct BmcBlobStatTx {
    uint16_t crc16;
    char     blob_id[]; /* Must correspond to a valid blob. */
};
```

The BMC returns the following data:

```
struct BmcBlobStatRx {
    uint16_t crc16;
    uint16_t blob_state;
    uint32_t size; /* Size in bytes of the blob. */
    uint8_t  metadata_len;
    uint8_t  metadata[]; /* Optional blob-specific metadata. */
};
```

The blob_state field is a bit field with the following flags:

```
enum BmcBlobStateFlagBits {
    OPEN_R =3D 0,
    OPEN_W =3D 1,
    COMMITTING =3D 2,
    COMMITTED =3D 3,
    COMMIT_ERROR =3D 4,
    <bits 5-7 reserved>
    <bits 8-15 given blob-specific definitions>
};
```

If the state is `COMMITTING`, the blob is not currently available for readi=
ng or
writing. If the state is `COMMITTED`, the blob may be available for reading=
.

The size field may be zero if the blob does not support reading.

Immediately following this structure are optional blob-specific bytes. The
number of bytes transferred is the size of the response body less the OEN a=
nd
sub-command and less the structure size. The metadata must fit in a single =
IPMI
packet, which has a platform-dependent maximum size. (For reference, Aspeed
supports 64 bytes max.)

If the blob is open or committed but has been inactive for longer than the
specified activity timeout, the blob is closed, and blob_status is set to
`CLOSED` in the response.

### BmcBlobSessionStat (9)

The `BmcBlobSessionStat` command returns the same data as `BmcBlobStat`.
However, this command operates on sessions, rather than blob IDs. Not all b=
lobs
must support this command; this is only useful when session semantics are m=
ore
useful than raw blob IDs.

```
struct BmcBlobSessionStatTx {
    uint16_t crc16;
    uint16_t session_id; /* Returned from BmcBlobOpen. */
};
```

```
struct BmcBlobSessionStatRx {
    uint16_t crc16;
    uint16_t blob_state;
    uint32_t size; /* Size in bytes of the blob. */
    uint8_t  metadata_size;
    uint8_t  metadata[]; /* Optional blob-specific metadata. */
};
```

## Idempotent Commands

The IPMI transport layer is somewhat flaky. Client code must rely on a
"send-with-retries" strategy to ensure that commands make their way from th=
e
host to the BMC. Commands can fail if the BMC is busy with other commands.

It is possible that an IPMI command successfully invokes the BMC-side handl=
er,
but that the response does not successfully make its way back to the host. =
In
this case, the host may decide to retry the command. Thus, command handlers
should be idempotent where possible; duplicate calls should return the same
value if repeated, while avoiding potentially destructive side-effects.

## Stale Sessions

Each blob type will define an operation for cleansing stale sessions. This =
could
involve scrubbing secrets or freeing buffers. A function will be provided t=
hat
will scan over each open session, to determine which if any sessions have b=
een
open for longer than 10 minutes with no activity. For each session, the
associated blob type=E2=80=99s cleansing routine will be invoked, and the a=
ssociated
session ID will be freed. This function will be invoked from the `BmcBlobOp=
en`
command handler, though not more than once every minute.

Patrick
