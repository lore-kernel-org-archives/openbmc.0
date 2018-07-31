Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::232; helo=mail-ua0-x232.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JfDRLG8z"; 
 dkim-atps=neutral
Received: from mail-ua0-x232.google.com (mail-ua0-x232.google.com
 [IPv6:2607:f8b0:400c:c08::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41fzqb55pNzF1BL
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 00:49:41 +1000 (AEST)
Received: by mail-ua0-x232.google.com with SMTP id y10-v6so10445999uao.4
 for <openbmc@lists.ozlabs.org>; Tue, 31 Jul 2018 07:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=bb5PdmVjdGgKIgmckOazjdbf46xJmu7xc+2m0QJi2mU=;
 b=JfDRLG8zSH/+4yGtLzg6Php97FGViSO1Vsn3EaZMdrEsxv7uTVHoLqqEefXFCzxW9X
 i6A+MjLdJxVtv3gS48lYJJJSTsGB8J3bUhQ3Hjmugj9rIenqj/0o2zD28oOXBtorhMsL
 U1YSnkayTjXhNH+oPQEC0DXDwGpcVj1mVkAfgepmNwDAmp1dYPecNOpZEICoZBwgvy7R
 65dHC8V/I6zGpA3+I2/vGemWX99ZFdcH92XLgvOFrqnhZ6+NfdKGWaqs4d5EQYTtTMEJ
 KxPJCVTzMb+B4tMTmR5kAowSzusjq+5DkN0zw/EK4wUMaYFsc3Cu69BYhAFJdEOvS+Ld
 Pn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=bb5PdmVjdGgKIgmckOazjdbf46xJmu7xc+2m0QJi2mU=;
 b=Q3WW59a57F9N79hgMm6fpc6tFX8uQEyj4ff+b6/QMX/7MEMMnHsI9fCdFiTjHDfbRt
 Esn5SvQAor2mTXVKp1WYW5hlGbtANEBZJL3D6Ktk27LDjYBpMnrPc3sSeDoAqL9/7/ce
 dgfDTQploxwAbl9cqaibK7XQvu6XyUulM9LGgG5su8SeAhcj6hlzgZL+kX9AtD0HxJbu
 4smEdHjqYPDecyGrZJcS90DnmjBe2vVTb65T5vObZBHGkHnsU/nEaq5kFXVFrbZnEhcX
 y/l9Ih2Lq0NnBg/tbnRPs8T2JTnwUK+jyjwcHvtqdeL4H5Qc8zu40/BiIsRgWON4D8Xy
 oa7w==
X-Gm-Message-State: AOUpUlEU98qbtKnBAoOkk1BEBRHNDEJ7b43VCuJgaVZI9KZod/+ilrSi
 rEiXrqVegR0PCv+GybYlO0MdPVwO/Pu97r0YOuiKEXPl
X-Google-Smtp-Source: AAOMgpdA2Ekg4z2biRCGksr3IjaNpCVzNg9ceJ1AB3l87HJSQuH6TMM0V/23xV2CtQKSuMCWrzuOXMfLNEZ+9l0tQ2Q=
X-Received: by 2002:ab0:6057:: with SMTP id
 o23-v6mr4865745ual.30.1533048578677; 
 Tue, 31 Jul 2018 07:49:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:101b:0:0:0:0:0 with HTTP; Tue, 31 Jul 2018 07:49:38
 -0700 (PDT)
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Tue, 31 Jul 2018 20:19:38 +0530
Message-ID: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
Subject: SSL Certificate management proposal.
To: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com, ed.tanous@intel.com
Content-Type: multipart/alternative; boundary="000000000000f49f2105724caf69"
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
X-List-Received-Date: Tue, 31 Jul 2018 14:49:48 -0000

--000000000000f49f2105724caf69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This proposal provides a mechanism to replace the self signed certificate
with  CA signed certificate based on BMC generated CSR.

What is CSR: Certificate Signing Request is a digital request  sent to
certificate authority(CA) to apply for a digital identity certificates,
which includes the  information about the organization info and a unique
identifying key( public key).

OpenSSL tools can be used to generate CSR and corresponding private key.

How to update a signed certificate on the BMC ?

The workflow for updating a signed certificate on the BMC consists of:
1. Generating a CSR on the BMC
2. Exporting the CSR from the BMC onto the user=E2=80=99s storage device
3. Obtaining a singed certificate corresponding to the CSR from a CA
4. Importing the signed certificate on the BMC

The user shall have the ability to export the generated CSR any number of
times until the signed certificate is imported.

In order to support the above workflow, the BMC shall provide the following
REST APIs:

   - Generate CSR
   - Renew CSR
   - Download CSR
   - Upload digitally signed certificate.
   - Activate digitally signed certificates
   - Download digitally signed certificate

Additional Requirements:

   - BMC should store the Signed certificate and private key in a
   persistent secured storage location..
   - Activate process shall validate the new certificate against the
   private key and information in the CSR.
   - Successful certificate activation shall replace the existing
   certificate and private key.
   - A new CSR generate request will overwrite the previous CSR. User
   should take caution to not repeat CSR requests to prevent overwriting
   pending CSRs.
   - Certificate management operation should be restricted for certain
   privilege levels.
   - As part of Boot process,  a new self-signed certificate is generated
   if:


   - No CA signed certificate is present or corrupted.
   - A self-signed certificate is not present or corrupted.
   - The certificate has expired.


   - Validity of the certificate must be ensured by the user or client
   application by periodically checking the expiry date. Certificate
   management feature may be be enhanced in future to generate events when =
the
   certificate is about to expire.


   - Existing REST session will be tossed during certificate activate
   process.


Note: REST/D-bus details not included here.

--000000000000f49f2105724caf69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>This proposal provides a mechanism to replace the self=
 signed certificate with=C2=A0 CA signed certificate based on BMC generated=
 CSR.<br><br>What is CSR: Certificate Signing Request is a digital request=
=C2=A0 sent to certificate authority(CA) to apply for a digital identity ce=
rtificates, which includes the=C2=A0 information about the organization inf=
o and a unique identifying key( public key).<br><br>OpenSSL tools can be us=
ed to generate CSR and corresponding private key. <br><br>How to update a s=
igned certificate on the BMC ?<br><br>The workflow for updating a signed ce=
rtificate on the BMC consists of:<br>1. Generating a CSR on the BMC<br>2. E=
xporting the CSR from the BMC onto the user=E2=80=99s storage device<br>3. =
Obtaining a singed certificate corresponding to the CSR from a CA<br>4. Imp=
orting the signed certificate on the BMC<br><br>The user shall have the abi=
lity to export the generated CSR any number of times until the signed certi=
ficate is imported.<br><br>In order to support the above workflow, the BMC =
shall provide the following REST APIs:<br><ul><li>Generate CSR</li><li>Rene=
w CSR</li><li>Download CSR</li><li>Upload digitally signed certificate.</li=
><li>Activate digitally signed certificates</li><li>Download digitally sign=
ed certificate</li></ul><p>Additional Requirements:<br></p><ul><li>BMC shou=
ld store the Signed certificate and private key in a persistent secured sto=
rage location..</li><li>Activate process shall validate the new certificate=
 against the private key and information in the CSR.</li><li>Successful cer=
tificate activation shall replace the existing certificate and private key.=
</li><li>A new CSR generate request will overwrite the previous CSR. User s=
hould take caution to not repeat CSR requests to prevent overwriting pendin=
g CSRs. </li><li>Certificate management operation should be restricted for =
certain privilege levels.</li><li>As part of Boot process,=C2=A0 a new self=
-signed certificate is generated if:<br></li></ul><div style=3D"margin-left=
:40px"><ul><li>No CA signed certificate is present or corrupted.</li><li>A =
self-signed certificate is not present or corrupted.</li><li>The certificat=
e has expired.</li></ul></div><ul><li>Validity of the certificate must be e=
nsured by the user or client application by periodically checking the expir=
y date. Certificate management feature may be be enhanced in future to gene=
rate events when the certificate is about to expire.</li></ul><ul><li>Exist=
ing REST session will be tossed during certificate activate process.</li></=
ul><br>Note: REST/D-bus details not included here.<br></div>

--000000000000f49f2105724caf69--
