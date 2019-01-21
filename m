Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::e2a; helo=mail-vs1-xe2a.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="lzGxnqxJ"; 
 dkim-atps=neutral
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43jsRC2nPvzDqXK
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 00:12:36 +1100 (AEDT)
Received: by mail-vs1-xe2a.google.com with SMTP id b74so12536666vsd.9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 05:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ULGxuWk/mXXnHzlPxTU8jkqva2axoEtJ2WdmISa0BhE=;
 b=lzGxnqxJiHEAVeu1yyre0AwqKQW8m0ZjWftWV2rP+3/GH0oGzD8Avb0zhNee/7DsYS
 wGzrCzMkiA5T9L1QbVSQwaJ5/L6hemID0oraD5MzyiNT+yfZlnCnW6A6vTDoHVjCczE4
 6yEc/yYjvYY03P2X9UbqhTXdy8Z5LanPFRP/1llhYEi+dnF95p3EnEwsIB0vzfyB/thk
 hd02tlyvkuGfhkEUBpLTnHhPGnTNJe5VH5kThXi1D72kl7aYqbCEVTV0DyXrImDQNagR
 mTt4cYzL2BOA/zSIsQJwsjEkR5mOyduh/VhO2Psx7R/Wpl6p9bewt1mRHgoohAFBC6kX
 bO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ULGxuWk/mXXnHzlPxTU8jkqva2axoEtJ2WdmISa0BhE=;
 b=a64DLTiUYsZR2G98MJXLaBkSAfjFhKpV4xe9QJt5e2JOr9+pY5u+oFtIfOZcJ62gS0
 l2XMJyl6ApESgxmJNvHVHNUxEbMW56MjX1HTAOf1DuBD5PLiHkd7qgclRveqQDdEoZK3
 y2xs8/NFONtGOTtVPcfSc5dMsxdeleCTLWxhozp1qyZ6BdehF5bNamySyGqCDGZS7CC0
 e4tDB1a3ptsLiwbYWOVp2cpkmO3qheSLnFEujtAkWsqNjYMTJtAz53D+9VKI5XPcIEPr
 9E66rIVGE3cHsS3x2uXW0mx765747OEfRmOMFeRKGSLMEWYhYf7lb4+8ugEz7rDFmRW9
 cXIg==
X-Gm-Message-State: AJcUukdtzhnCFY1aoY55lKRSu+K8PCWzpNv1MsuI8ASnUQHL1VZM9R4J
 HEXHH41LbnRK+BliG8zUaqSO2niXv6Tn/CXMEuqgp/ca
X-Google-Smtp-Source: ALg8bN4J4bHTNpwJypg/k4N56tSs0LA3Vbfy4mlHi/TSvG6Rokgj/aBC33IW79UDpc33gk1gU1MObocZdRPczHfskbM=
X-Received: by 2002:a67:4a48:: with SMTP id x69mr12374244vsa.93.1548076353389; 
 Mon, 21 Jan 2019 05:12:33 -0800 (PST)
MIME-Version: 1.0
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Mon, 21 Jan 2019 18:42:33 +0530
Message-ID: <CACkAXSq6PDM2FVjeiU3uPj=_1u68Q9Ffj4p4eRQ-v5oqKbOL1A@mail.gmail.com>
Subject: Redfish Certificate upload in OpenBMC.
To: openbmc@lists.ozlabs.org, ed.tanous@intel.com, devenrao@in.ibm.com
Content-Type: multipart/alternative; boundary="00000000000021091e057ff79da3"
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
X-List-Received-Date: Mon, 21 Jan 2019 13:12:40 -0000

--00000000000021091e057ff79da3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

DMTF Redfish latest version 2018.3  added support for the certificate
management schemas.

Reference:
https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.pd=
f

https://www.dmtf.org/content/redfish-update-adds-support-certificate-manage=
ment-sensors

*Uploading a  pre-generated certificate:*
   - The User navigates to the appropriate certificate collection.
         Example: for uploading HTTPS server certificate:
                     URI:
/redfish/v1/Managers/{ManagerId}/NetworkProtocol/HTTPS/Certificates
   - The user performs a POST on the Certificate with the certificate (
includes Private key) string in the body.
        -  POST method should  support business logic to call the right
d-bus certificate upload based on the url.
       - Creates a new link and this link details are availble as part
certificatelocation "GET" method"
              Example:
/redfish/v1/Managers/{ManagerId}/NetworkProtocol/HTTPS/Certificates/1

*Replacing a certificate:*
  - use the action  #CertificateService.ReplaceCertificate{ } in the
certificate service by providing link to the certificate that is being to
replaced.

*Deleting certificate:*
 - Not allowed.
Note: Not a valid use case for client/server type certificates. This may be
required for Authority type certificate , need more investigation on this.

Looking fro community feedback on the proposed approach related to
certificate upload/management.

Note: Not included CSR based certificate upload/Management.

*Certificate Management Schemas information:*

Certificate: The Certificate resource describes a certificate used to prove
the identify of a component, account, or service

CertificateService: resource off the Service Root
    Contains service level Actions
        GenerateCSR: Manage certificate signing requests from a user
        ReplaceCertificate: Provide an atomic approach for deleting and
adding a certificate

CertificateCollection:
    Perform standard Create operations for managing certificates
    Collections added to resources that can have certificates installed to
it
        The location of the collection will inform the client about the
relationship between the
        certificate and other resources in the data model
        Available URI=E2=80=99s

/redfish/v1/AccountService/Accounts/{ManagerAccountId}/Certificates/
        /redfish/v1/AccountService/ActiveDirectory/Certificates/

/redfish/v1/AccountService/ExternalAccountProviders/{ExternalAccountProvide=
rId}/Certificates/
        /redfish/v1/AccountService/LDAP/Certificates/
        /redfish/v1/Managers/{ManagerId}/NetworkProtocol/HTTPS/Certificates

/redfish/v1/Managers/{ManagerId}/RemoteAccountService/Accounts/{ManagerAcco=
untId}/Certificates/

/redfish/v1/Managers/{ManagerId}/RemoteAccountService/ActiveDirectory/Certi=
ficates/

/redfish/v1/Managers/{ManagerId}/RemoteAccountService/ExternalAccountProvid=
ers/{ExternalAccountProviderId}/Certificates/


/redfish/v1/Managers/{ManagerId}/RemoteAccountService/LDAP/Certificates/

CertificateLocations:resource contains links to all the certificates so
administrators and auditors can easily obtain a complete set

--00000000000021091e057ff79da3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">DMTF Redfish latest version 2018.3=C2=A0 =
added support for the certificate management schemas.<br><br>Reference: <a =
href=3D"https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Ove=
rview.pdf">https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_=
Overview.pdf</a><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://w=
ww.dmtf.org/content/redfish-update-adds-support-certificate-management-sens=
ors">https://www.dmtf.org/content/redfish-update-adds-support-certificate-m=
anagement-sensors</a><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br><b>Uploading a=
=C2=A0 pre-generated certificate:</b><br>=C2=A0=C2=A0 - The User navigates =
to the appropriate certificate collection.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Example: for uploading HTTPS server certificate:<br>=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 URI:=C2=A0 /redfish/v1/Manage=
rs/{ManagerId}/NetworkProtocol/HTTPS/Certificates<br>=C2=A0=C2=A0 - The use=
r performs a POST on the Certificate with the certificate ( includes Privat=
e key) string in the body.<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
=C2=A0 POST method should=C2=A0 support business logic to call the right d-=
bus certificate upload based on the url.<br>=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 - Creates a new link and this link details are availble as part certificat=
elocation &quot;GET&quot; method&quot;<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Example: /redfish/v1/Managers=
/{ManagerId}/NetworkProtocol/HTTPS/Certificates/1<br><br><b>Replacing a cer=
tificate:</b><br>=C2=A0 - use the action=C2=A0 #CertificateService.ReplaceC=
ertificate{ } in the certificate service by providing link to the certifica=
te that is being to replaced.<br><br><b>Deleting certificate:</b><br>=C2=A0=
- Not allowed. <br>Note: Not a valid use case for client/server type certif=
icates. This may be required for Authority type certificate , need more inv=
estigation on this.<br><br>Looking fro community feedback on the proposed a=
pproach related to certificate upload/management.<br><br>Note: Not included=
 CSR based certificate upload/Management.<br><br><b>Certificate Management =
Schemas information:</b><br><br>Certificate: The Certificate resource descr=
ibes a certificate used to prove the identify of a component, account, or s=
ervice<br><br>CertificateService: resource off the Service Root<br>=C2=A0=
=C2=A0=C2=A0 Contains service level Actions<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 GenerateCSR: Manage certificate signing requests from a use=
r<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ReplaceCertificate: Provide=
 an atomic approach for deleting and adding a certificate<br><br>Certificat=
eCollection:<br>=C2=A0=C2=A0=C2=A0 Perform standard Create operations for m=
anaging certificates<br>=C2=A0=C2=A0=C2=A0 Collections added to resources t=
hat can have certificates installed to it<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 The location of the collection will inform the client about th=
e relationship between the <br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
ertificate and other resources in the data model<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Available URI=E2=80=99s <br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /=
redfish/v1/AccountService/Accounts/{ManagerAccountId}/Certificates/<br>=C2=
=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /redfish/v1/AccountService/ActiveDirecto=
ry/Certificates/<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /redfish/v1/Accou=
ntService/ExternalAccountProviders/{ExternalAccountProviderId}/Certificates=
/<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /redfish/v1/AccountService/LDAP/=
Certificates/<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /redfish/v1/Managers=
/{ManagerId}/NetworkProtocol/HTTPS/Certificates<br>=C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 /redfish/v1/Managers/{ManagerId}/RemoteAccountService/Accou=
nts/{ManagerAccountId}/Certificates/<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=
=A0 /redfish/v1/Managers/{ManagerId}/RemoteAccountService/ActiveDirectory/C=
ertificates/<br>=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /redfish/v1/Managers/=
{ManagerId}/RemoteAccountService/ExternalAccountProviders/{ExternalAccountP=
roviderId}/Certificates/=C2=A0=C2=A0=C2=A0 <br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /redfish/v1/Managers/{ManagerId}/R=
emoteAccountService/LDAP/Certificates/<br><br>CertificateLocations:resource=
 contains links to all the certificates so administrators and auditors can =
easily obtain a complete set<br></div></div>

--00000000000021091e057ff79da3--
