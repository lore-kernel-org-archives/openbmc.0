Return-Path: <ojayanth@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c05::22d; helo=mail-vk0-x22d.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vX0iN7DN"; 
 dkim-atps=neutral
Received: from mail-vk0-x22d.google.com (mail-vk0-x22d.google.com
 [IPv6:2607:f8b0:400c:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yy7Qw18lqzDsQl
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 20:23:35 +1100 (AEDT)
Received: by mail-vk0-x22d.google.com with SMTP id u84so3123976vke.10
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 01:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=G0xNjlFZrQOIEHIFoBupq15Xsa2pinvBfl4skodqCLM=;
 b=vX0iN7DNpYyasnjOpQ6D8L7o59crH5BaUcPh+p4TMXA6MuQYfbY24NlOd8fUzrNsGb
 w497amJn9uBDZ/1fXSSabuxT2VlLdeuZVJIYlmfYFwLY50biuIjHwfyzaUp6oW1seOXv
 XLRZ4ITryDbQHFojGb+/Q/2lsujDRLjbZfA93G/Gwp++ecUXGAjSpBWC/I0ecngeP5ss
 yrwS4/AmKBd9btiOXb0RnuiA2+qAnbaTDP0R1T0Ca3xsARLeKk5JB1LXPqm2mCEEz5X2
 xvuol8sUj0G4eAKR7Zw1oEEPuMWtkHYZuq3blSwzz0osqhczN2k04K8gPy2Sohvq3E0A
 GXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=G0xNjlFZrQOIEHIFoBupq15Xsa2pinvBfl4skodqCLM=;
 b=gwkKz9hzOxjT6UWZJOvUSak6aM8GVWItjexxX54UIn3P/gKmmCIcrMSzi34W7KGloc
 cyAf4vn2wkinF/0oedhpAPkohBM092Jh63w4B8G76/vsP17mcGtlpzyOP+1hIgR5n5h/
 OO91JVyrBrvLVIERJFUrawIIDaOCE51Ugku2UtKq42zIY+RYr/TnljZkMp5ud0is7Q3d
 lZL5jnZ+SpO8XzALLxgz/kH4Bx9TTbCAY47LDDCCT9iraVj3jLFobqhIpGrAZ7DTIRdh
 YwlFM25Jy0A+fzeJuG5nMRGNT1SH7vBMqUImclmHSsUp2x78SSlYl9VIjnurr6riMFoJ
 Ohkg==
X-Gm-Message-State: AKGB3mKZ13vQh58yDDu/mRfuehGM4uP9LOHcfyF6/bi0pediNuSzX7b7
 t+TGS1Fq8av64IySLHA3jdzzNlb9/IPUaX5TVjtWtA==
X-Google-Smtp-Source: ACJfBouFkhQgXJDuhBC4dgp2h8y3o0SMsw6aPZeq9EEHvq1G8ILzuWq4Ou0s1rXYr0MODjT73OkWEIPiDAAEiJRIi9g=
X-Received: by 10.31.93.134 with SMTP id r128mr9745360vkb.143.1513243412813;
 Thu, 14 Dec 2017 01:23:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.26.32 with HTTP; Thu, 14 Dec 2017 01:23:32 -0800 (PST)
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Thu, 14 Dec 2017 14:53:32 +0530
Message-ID: <CACkAXSrqHOkyDZpYRCtibiA6CQ9Z7XRXw5BcTkvDSMwd1pEvjQ@mail.gmail.com>
Subject: dreport will replace ffdc tool starting from Feb-2018.
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="94eb2c09306214704705604970b6"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Dec 2017 09:23:37 -0000

--94eb2c09306214704705604970b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Starting feb-2018 ffdc tool will be removed from openbmc builds. dreport
will replace ffdc tool with support for additional features.  dreport is
already available in openbmc builds.

Users of ffdc tool must plan to migrate to dreport.

dreport is  a drop-in replacement for ffdc.  ie run dreport instead of
ffdc.

Usage info is as follows.

        dreport creates an archive(xz compressed) consisting of the
following:
                * Configuration information
                * Debug information
                * A summary report
        The type parameter controls the content of the data. The generated
        archive is stored in the user specified location.

usage: dreport [OPTION]

Options:
        -n, =E2=80=94-name <name>     Name to be used for the archive.
                              Default name format obmcdump_<id>_<epochtime>
        -d, =E2=80=94-dir <directory> Archive directory to copy the compres=
sed
report.
                              Default output directory is /tmp
        -i, =E2=80=94-id <id>         Dump identifier to associate with the=
 archive.
                              Identifiers include numeric characters.
                              Default dump identifier is 0
        -t, =E2=80=94-type <type>     Data collection type. Valid types are
                              user, core, elog.
                              Default type is user initiated.
        -p, =E2=80=94-path <path>     Optional contents to be included in t=
he
archive.
                              Valid paths are absolute file path or d-bus
path
                              based on type parameter.
                                 -Absolute file path for core type.
                                 -elog d-bus object for elog type.
        -s, --size <size>     Maximum allowed size(in KB) of the archive.
                              Report will be truncated in case size exceeds
                              this limit. Default size is unlimited.
        -v, =E2=80=94-verbose         Increase logging verbosity.
        -V, --version         Output version information.
        -q, =E2=80=94-quiet           Only log fatal errors to stderr
        -h, =E2=80=94-help            Display this help and exit.

--94eb2c09306214704705604970b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+U3RhcnRpbmcgZmViLTIwMTggZmZkYyB0b29sIHdpbGwgYmUgcmVtb3Zl
ZCBmcm9tIG9wZW5ibWMgYnVpbGRzLiBkcmVwb3J0IHdpbGwgcmVwbGFjZSBmZmRjIHRvb2wgd2l0
aCBzdXBwb3J0IGZvciBhZGRpdGlvbmFsIGZlYXR1cmVzLsKgIGRyZXBvcnQgaXPCoCBhbHJlYWR5
IGF2YWlsYWJsZSBpbiBvcGVuYm1jIGJ1aWxkcy4gPGJyPjxicj5Vc2VycyBvZiBmZmRjIHRvb2wg
bXVzdCBwbGFuIHRvIG1pZ3JhdGUgdG8gZHJlcG9ydC7CoMKgIDxicj48YnI+ZHJlcG9ydCBpc8Kg
IGEgZHJvcC1pbiByZXBsYWNlbWVudCBmb3IgZmZkYy7CoCBpZSBydW4gZHJlcG9ydCBpbnN0ZWFk
IG9mIGZmZGMuIDxicj48YnI+VXNhZ2UgaW5mbyBpcyBhcyBmb2xsb3dzLiA8YnI+PGJyPsKgwqDC
oMKgwqDCoMKgIGRyZXBvcnQgY3JlYXRlcyBhbiBhcmNoaXZlKHh6IGNvbXByZXNzZWQpIGNvbnNp
c3Rpbmcgb2YgdGhlIGZvbGxvd2luZzo8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogQ29uZmlndXJhdGlvbiBpbmZvcm1hdGlvbjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKiBEZWJ1ZyBpbmZvcm1hdGlvbjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgKiBBIHN1bW1hcnkgcmVwb3J0PGJyPsKgwqDCoMKgwqDCoMKgIFRoZSB0eXBlIHBhcmFtZXRl
ciBjb250cm9scyB0aGUgY29udGVudCBvZiB0aGUgZGF0YS4gVGhlIGdlbmVyYXRlZDxicj7CoMKg
wqDCoMKgwqDCoCBhcmNoaXZlIGlzIHN0b3JlZCBpbiB0aGUgdXNlciBzcGVjaWZpZWQgbG9jYXRp
b24uPGJyPjxicj51c2FnZTogZHJlcG9ydCBbT1BUSU9OXTxicj48YnI+T3B0aW9uczo8YnI+wqDC
oMKgwqDCoMKgwqAgLW4sIOKAlC1uYW1lICZsdDtuYW1lJmd0O8KgwqDCoMKgIE5hbWUgdG8gYmUg
dXNlZCBmb3IgdGhlIGFyY2hpdmUuPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRGVmYXVsdCBuYW1lIGZvcm1hdCBvYm1jZHVtcF8m
bHQ7aWQmZ3Q7XyZsdDtlcG9jaHRpbWUmZ3Q7PGJyPsKgwqDCoMKgwqDCoMKgIC1kLCDigJQtZGly
ICZsdDtkaXJlY3RvcnkmZ3Q7IEFyY2hpdmUgZGlyZWN0b3J5IHRvIGNvcHkgdGhlIGNvbXByZXNz
ZWQgcmVwb3J0Ljxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIERlZmF1bHQgb3V0cHV0IGRpcmVjdG9yeSBpcyAvdG1wPGJyPsKgwqDC
oMKgwqDCoMKgIC1pLCDigJQtaWQgJmx0O2lkJmd0O8KgwqDCoMKgwqDCoMKgwqAgRHVtcCBpZGVu
dGlmaWVyIHRvIGFzc29jaWF0ZSB3aXRoIHRoZSBhcmNoaXZlLjxicj7CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIElkZW50aWZpZXJzIGlu
Y2x1ZGUgbnVtZXJpYyBjaGFyYWN0ZXJzLjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIERlZmF1bHQgZHVtcCBpZGVudGlmaWVyIGlz
IDA8YnI+wqDCoMKgwqDCoMKgwqAgLXQsIOKAlC10eXBlICZsdDt0eXBlJmd0O8KgwqDCoMKgIERh
dGEgY29sbGVjdGlvbiB0eXBlLiBWYWxpZCB0eXBlcyBhcmU8YnI+wqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1c2VyLCBjb3JlLCBlbG9n
Ljxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIERlZmF1bHQgdHlwZSBpcyB1c2VyIGluaXRpYXRlZC48YnI+wqDCoMKgwqDCoMKgwqAg
LXAsIOKAlC1wYXRoICZsdDtwYXRoJmd0O8KgwqDCoMKgIE9wdGlvbmFsIGNvbnRlbnRzIHRvIGJl
IGluY2x1ZGVkIGluIHRoZSBhcmNoaXZlLjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZhbGlkIHBhdGhzIGFyZSBhYnNvbHV0ZSBm
aWxlIHBhdGggb3IgZC1idXMgcGF0aDxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJhc2VkIG9uIHR5cGUgcGFyYW1ldGVyLjxicj7C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC1BYnNvbHV0ZSBmaWxlIHBhdGggZm9yIGNvcmUgdHlwZS48YnI+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtZWxv
ZyBkLWJ1cyBvYmplY3QgZm9yIGVsb2cgdHlwZS48YnI+wqDCoMKgwqDCoMKgwqAgLXMsIC0tc2l6
ZSAmbHQ7c2l6ZSZndDvCoMKgwqDCoCBNYXhpbXVtIGFsbG93ZWQgc2l6ZShpbiBLQikgb2YgdGhl
IGFyY2hpdmUuPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgUmVwb3J0IHdpbGwgYmUgdHJ1bmNhdGVkIGluIGNhc2Ugc2l6ZSBleGNl
ZWRzPGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdGhpcyBsaW1pdC4gRGVmYXVsdCBzaXplIGlzIHVubGltaXRlZC48YnI+wqDCoMKg
wqDCoMKgwqAgLXYsIOKAlC12ZXJib3NlwqDCoMKgwqDCoMKgwqDCoCBJbmNyZWFzZSBsb2dnaW5n
IHZlcmJvc2l0eS48YnI+wqDCoMKgwqDCoMKgwqAgLVYsIC0tdmVyc2lvbsKgwqDCoMKgwqDCoMKg
wqAgT3V0cHV0IHZlcnNpb24gaW5mb3JtYXRpb24uPGJyPsKgwqDCoMKgwqDCoMKgIC1xLCDigJQt
cXVpZXTCoMKgwqDCoMKgwqDCoMKgwqDCoCBPbmx5IGxvZyBmYXRhbCBlcnJvcnMgdG8gc3RkZXJy
PGJyPsKgwqDCoMKgwqDCoMKgIC1oLCDigJQtaGVscMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRGlz
cGxheSB0aGlzIGhlbHAgYW5kIGV4aXQuPGJyPjwvZGl2Pg0K
--94eb2c09306214704705604970b6--
