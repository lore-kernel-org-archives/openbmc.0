Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::a43; helo=mail-vk1-xa43.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="u/m0KNPx"; 
 dkim-atps=neutral
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 440dD16NnHzDqS8
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 00:54:09 +1100 (AEDT)
Received: by mail-vk1-xa43.google.com with SMTP id e131so1391426vkf.10
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 05:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=eVATF6UaKJp5YkwZagSKveDUMaNssjxWACdwRnPNRWY=;
 b=u/m0KNPxThIRYy1+J8lzsBoEaurIKtW/4AEbSwDPfZpF3LafdK47Hed9nrkwirnmLq
 uSny2lj8sA9x7b0PItaVPDhy9pIQ65sXYGVy8NuTaloeVASYfdURUEyxEuGfSx8VD2I4
 TVY3g9fTp4CfYcrWLbXxd95Z64YAnaqOJfVTTncu1tdsYMRo3Du9PNkkpWSS7C2gwipa
 PWMI8TqXjgZ+ZVIuBut2wQMgmGNDdYeBTVeH905f965wI8TAvf4QiRsdpicIU9okmmvk
 L+G8fW8FgCBSktooLvsluPi1RoB3SQoi+Zn0plGHZlzb2esJ4LO0p870aULwhW33Kewx
 EU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=eVATF6UaKJp5YkwZagSKveDUMaNssjxWACdwRnPNRWY=;
 b=JEKxSVLOzXuRRNN+p+Kc9GKlt0d7WKdqeaVrGdX7X7yMxJoie2JyUPokcYUhbRI04i
 Z4SDiXEXrNtl4d/3UYR4yVrrO9nfPcTKUZh8BvfxNKB/SV6WU1lUO7Zut+uDF3bousnJ
 mBt0I762AZqCXqtcDbSdB0YvBgBPBBI9YYXvhIpClcMZjuQo9ZdfiOQVSgm9/z07b7FT
 u76plrgbXnGapnHvFrixBB1TGXygRXQVrv6zhHQxsixUBfHKpy4for0wZZziM2uVw2sm
 8UTAZkyV6b7G0yt0AhSOp5xrQscAmL1zIh6T4OhUHXt4pcFsozKEKhhNT6ar7ine3+SC
 bUYA==
X-Gm-Message-State: AHQUAubYKOYvXlxMrP9THttZRPysZeFd1sQaCrH5941vC6Iv8LbUNUvX
 YNGSl4XFCHYY3T8VgsGy2nARJl0/C2VnAJl0kojTVkLH
X-Google-Smtp-Source: AHgI3IZHys+1XMHCPStWho8Pc+Iy4uoiPTnG/oxaq1AAtf6EuTZ0M3j3pPCOqUuLI+gmmkV0Qb3TpgUfqFfgECgQycA=
X-Received: by 2002:a1f:8901:: with SMTP id l1mr2002617vkd.66.1550152445618;
 Thu, 14 Feb 2019 05:54:05 -0800 (PST)
MIME-Version: 1.0
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Thu, 14 Feb 2019 19:23:53 +0530
Message-ID: <CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com>
Subject: Redfish: Generating and installing CSR based certificates.
To: openbmc@lists.ozlabs.org, ed.tanous@intel.com, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="000000000000de6d0b0581dafdb3"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 13:54:10 -0000

--000000000000de6d0b0581dafdb3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

All,
Please find the Redflish based CSR ( Certificate Signing Request)
generation and installing the certificate in BMC.
This is based on the latest Redfish spec (Reference:
https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pd=
f)
and related documents.
Included the Gerrit link related to  d-bus interfaces :
    Review Link:
https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/1=
6571/

Looking for the inputs  on this  design flow and any additional changes
required from the security aspect on managing private keys in the BMC.

   - The user performs the GenerateCSR action ( URIs:
   /redfish/v1/CertificateService ) with required parameters.
      - Certificate service provides a d-bus interface to generate CSR .
         - Certificate manager create Private key and saves the service
         specific path
         - Returns the d-bus path for the newly created CSR.


   -  Certificate service provides d-bus interface to download CSR
         -  The user need need wait for the creation of CSR specific d-bus
         path to download the newly created CSR
      -  The user takes the CSR file and get it signed by the appropriate
      authority.
         -  This step is outside the scope of Redfish.
      -  The user navigates to the appropriate certificate collection
      -   Example: if trying to replace the HTTPS certificate for a
      Manager, navigate to the Manager=E2=80=99s Certificate Collection tha=
t is
      subordinate to the   NetworkProtocol/HTTPS object
   - The user performs a POST on the Certificate Collection with the
   certificate string in the body
      -  Use the existing certificate upload d-bus interface.
   - Certificate manager validates the certificate with the available
   service specific private keys in the BMC.
   - After successful validation  pairs the private key used in the first
   step with the installed certificate.

Assumption:

   - For a service, BMC allows maximum 3 ( ?) CSR requests. Any new request
   after this will remove the oldest private key information from the BMC.
   - User has to do a Factory removing  the private key from the system.

--000000000000de6d0b0581dafdb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>All,</div><div>Plea=
se find the Redflish based CSR ( Certificate Signing Request) generation an=
d installing the certificate in BMC. <br></div><div>This is based on the la=
test Redfish spec (Reference: <a href=3D"https://www.dmtf.org/sites/default=
/files/Redfish_2018_Release_3_Overview.pdf">https://www.dmtf.org/sites/defa=
ult/files/Redfish_2018_Release_3_Overview.pdf</a>) and related documents. <=
br></div><div>Included the Gerrit link related to=C2=A0 d-bus interfaces : =
<br></div><div>=C2=A0 =C2=A0 Review Link: <a href=3D"https://gerrit.openbmc=
-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/">https://gerrit.=
openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/</a></div>=
<div><br></div><div>Looking for the inputs=C2=A0 on this=C2=A0 design flow =
and any additional changes required from the security aspect on managing pr=
ivate keys in the BMC. <br></div><div><ul><li>The user performs the Generat=
eCSR action ( URIs: /redfish/v1/CertificateService ) with required paramete=
rs.</li><ul><li>Certificate service provides a d-bus interface to generate =
CSR .</li><ul><li>Certificate manager create Private key and saves the serv=
ice specific path <br></li><li>Returns the d-bus path for the newly created=
 CSR.</li></ul></ul></ul><ul><ul><li>=C2=A0Certificate service provides d-b=
us interface to download CSR</li><ul><li>=C2=A0The user need need wait for =
the creation of CSR specific d-bus path to download the newly created CSR</=
li></ul><li>=C2=A0The user takes the CSR file and get it signed by the appr=
opriate authority.</li><ul><li>=C2=A0This step is outside the scope of Redf=
ish.</li></ul></ul><li>=C2=A0The user navigates to the appropriate certific=
ate collection</li><ul><li>=C2=A0 Example: if trying to replace the HTTPS c=
ertificate for a Manager, navigate to the Manager=E2=80=99s Certificate Col=
lection that is subordinate to the=C2=A0=C2=A0 NetworkProtocol/HTTPS object=
</li></ul><li>The user performs a POST on the Certificate Collection with t=
he certificate string in the body</li><ul><li>=C2=A0Use the existing certif=
icate upload d-bus interface.</li></ul><li>Certificate manager validates th=
e certificate with the available service specific private keys in the BMC.<=
/li><li>After successful validation=C2=A0 pairs the private key used in the=
 first step with the installed certificate.</li></ul>Assumption:<br></div><=
ul><li>For a service, BMC allows maximum 3 ( ?) CSR requests. Any new reque=
st after this will remove the oldest private key information from the BMC.<=
/li><li>User has to do a Factory removing=C2=A0 the private key from the sy=
stem.</li></ul></div></div></div>

--000000000000de6d0b0581dafdb3--
