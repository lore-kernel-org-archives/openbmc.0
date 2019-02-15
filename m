Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::a33; helo=mail-vk1-xa33.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NQhJ+Taq"; 
 dkim-atps=neutral
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4411qN0xCZzDqKR
 for <openbmc@lists.ozlabs.org>; Fri, 15 Feb 2019 16:22:39 +1100 (AEDT)
Received: by mail-vk1-xa33.google.com with SMTP id j68so1955234vke.13
 for <openbmc@lists.ozlabs.org>; Thu, 14 Feb 2019 21:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v31wN4oSQO2YGE6G8pcGSoAFmQiAcW90c+SIX26vaoo=;
 b=NQhJ+TaqV4vTZ/ZH8/aW017j2dzam1yq8KrJxfk+6MdJGxIKS4LLBnpMictzPwGFuo
 0heXLpUZDYsiOCPMrExH4GVeObq+xhJlfKol23qqbuMHnf0qaUjvN+GG39i+D4cz5xhT
 7EOwfkf55WdgwpfjKWZRW3HWlBL2ywUScS01nqCMSkhwipol2WKGQYGklMAZa7jhMaP1
 Aoan+K+xf+8gbg/mf7830R879bITqgZI0epJ+PsWUb4kfLq/gDyCb/V+RN8gVjlC7P2T
 1IKzE02Rf6f9McHfYkyTGLxd+GhEPF9hBrBrO6sizJE3zsh1EFTAbdO3Fr/YWty7wGgo
 ChmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v31wN4oSQO2YGE6G8pcGSoAFmQiAcW90c+SIX26vaoo=;
 b=JhLF17oQptS+mluXfxLoVcs/kAeyORGQ2OFzIsp8WxGZ/DVCgSvc9VckZRZ4tqyMBP
 DSj3yDtBdfJQFYG9CmZzCkT8IGfRnIaMvmUnAgy/saoup/s6aWIks8DpQnlhKYZZwF7V
 vzH1hEUaD9YphA15ighZJR4PkydaBBD2+91ofa6d48KM4rhLYhDJg3t6BrxMQ8mYpXa+
 IAZ+FDEa+wVA9osPo24emEGXtXq+qN/+hmJqsRRhLlAlLt6SfJ6isj/hqCs4K7a81UYP
 xwOtGJ41BpwJTzrshj3jcmYiTnPo1wRT3YBSzDt14nmZytQqZrwTEhIOsI3+6aX6MmeQ
 3OUQ==
X-Gm-Message-State: AHQUAuYaFDZZzZ1VEfM8t48uEBVye9Bz2S22fC1paB/KxE+GgkggyiIr
 yOldPqsZQIICrpSPpUPviR5KVkSLYxJKEurTVR8=
X-Google-Smtp-Source: AHgI3IbsiZ+soMwCWOqiNz4TIMxpK+bQ3d4mMTkNSvdUqycMTULHt5RqmX1WR+lEUWMKFrgM6pfsIAdElA/aCaXMd64=
X-Received: by 2002:a1f:94cd:: with SMTP id w196mr3246590vkd.60.1550208156829; 
 Thu, 14 Feb 2019 21:22:36 -0800 (PST)
MIME-Version: 1.0
References: <CACkAXSpTdZ8s_Qd2j1qkwBy7Ti+7ieOzyJtcLkCEqBmsLWs4AQ@mail.gmail.com>
 <827200f4-1c4f-9619-1037-26473a9b81e1@linux.vnet.ibm.com>
In-Reply-To: <827200f4-1c4f-9619-1037-26473a9b81e1@linux.vnet.ibm.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Fri, 15 Feb 2019 10:52:27 +0530
Message-ID: <CACkAXSpKjAkJ4tntZWRdpsdaFkKRjntV8H3aUH0bM_gDutHDiA@mail.gmail.com>
Subject: Re: Redfish: Generating and installing CSR based certificates.
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000840f0d0581e7f68f"
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
X-List-Received-Date: Fri, 15 Feb 2019 05:22:41 -0000

--000000000000840f0d0581e7f68f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 9:54 AM Ratan Gupta <ratagupt@linux.vnet.ibm.com>
wrote:

> Hi Jayanth,
>
> I have some querys
> On 14/02/19 7:23 PM, Jayanth Othayoth wrote:
>
> All,
> Please find the Redflish based CSR ( Certificate Signing Request)
> generation and installing the certificate in BMC.
> This is based on the latest Redfish spec (Reference:
> https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overview.=
pdf)
> and related documents.
> Included the Gerrit link related to  d-bus interfaces :
>     Review Link:
> https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+=
/16571/
>
> Looking for the inputs  on this  design flow and any additional changes
> required from the security aspect on managing private keys in the BMC.
>
>    - The user performs the GenerateCSR action ( URIs:
>    /redfish/v1/CertificateService ) with required parameters.
>       - Certificate service provides a d-bus interface to generate CSR .
>          - Certificate manager create Private key and saves the service
>          specific path
>          - Returns the d-bus path for the newly created CSR.
>
> I am hoping this design is wrt Redfish, which explains the flow to deploy
> CSR based certificate.
>
> I was little confused about d-bus interface terminology here, I understan=
d
> that in redfish we have certificate service schema which has action
>
> GenerateCSR, I am assuming we are talking about the same.
>
> GenerateCSR should not return the d-bus Path however it should return the=
 URI
> of the Certificate Collection where the certificate will be installed.
>
@ratan Certificate manager design is services ( HTTPS Server, LDAP client
etc) . we don't need to get collection object based uri here because BMC
web is running from collection object context . The  d-bus object uri
mentioned here , just used to watch CSR is ready and return info to redfish
user.

Does the GenerateCSR creates CSR resource which can be modifiable in future=
?
>
>
>    -  Certificate service provides d-bus interface to download CSR
>          -  The user need need wait for the creation of CSR specific
>          d-bus path to download the newly created CSR
>
> Does the certificate service schema have the action Download CSR?
>
-No ,  Redfish GenerateCSR methods expect CSR text as output.

> I hope that response of GenerateCSR returns the CSR, There should not be
> another redfish call to get the CSR.
>
- Single call from Redfish point.

>
>    -  The user takes the CSR file and get it signed by the appropriate
>       authority.
>          -  This step is outside the scope of Redfish.
>       -  The user navigates to the appropriate certificate collection
>       -   Example: if trying to replace the HTTPS certificate for a
>       Manager, navigate to the Manager=E2=80=99s Certificate Collection t=
hat is
>       subordinate to the   NetworkProtocol/HTTPS object
>    - The user performs a POST on the Certificate Collection with the
>    certificate string in the body
>       -  Use the existing certificate upload d-bus interface.
>    - Certificate manager validates the certificate with the available
>    service specific private keys in the BMC.
>    - After successful validation  pairs the private key used in the first
>    step with the installed certificate.
>
> Would the implementation persist the CSR and associated private key for
> verification?
>
- yes.

> I can understand that we can do the verification of public/private key
> through oprenssl function, but is there a possibility that user can chang=
e
> the CSR request(eg change the organization)
>
 Redfish doesn't support this now , Any real use case for this?

> and get it signed and upload the certificate, How the implementation take=
s
> care of it?
>
> Now suppose user creates three CSR request and on the BMC we have three
> associated private keys and once user upload the certificate
>
> would the implementation starts matching the certificate public key with
> all the stored private keys and once it gets matched
>
> then the implementation creates the pairing?
> How the certificates would be deleted?
>

redfish supports only certificate replace. no delete ,
Planing to check with redfish community on this , this feature will be
useful for Authority type certificates.

>
> Assumption:
>
>    - For a service, BMC allows maximum 3 ( ?) CSR requests. Any new
>    request after this will remove the oldest private key information from=
 the
>    BMC.
>    - User has to do a Factory removing  the private key from the system.
>
> Regards
>
> Ratan Gupta
>

--000000000000840f0d0581e7f68f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 15, 2019 at 9:54 AM Ratan=
 Gupta &lt;<a href=3D"mailto:ratagupt@linux.vnet.ibm.com">ratagupt@linux.vn=
et.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF">
    <p>Hi Jayanth,</p>
    <p>I have some querys<br>
    </p>
    <div class=3D"gmail-m_-4306834406775087264moz-cite-prefix">On 14/02/19 =
7:23 PM, Jayanth Othayoth
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div>All,</div>
            <div>Please find the Redflish based CSR ( Certificate
              Signing Request) generation and installing the certificate
              in BMC. <br>
            </div>
            <div>This is based on the latest Redfish spec (Reference: <a hr=
ef=3D"https://www.dmtf.org/sites/default/files/Redfish_2018_Release_3_Overv=
iew.pdf" target=3D"_blank">https://www.dmtf.org/sites/default/files/Redfish=
_2018_Release_3_Overview.pdf</a>)
              and related documents. <br>
            </div>
            <div>Included the Gerrit link related to=C2=A0 d-bus interfaces=
 :
              <br>
            </div>
            <div>=C2=A0 =C2=A0 Review Link: <a href=3D"https://gerrit.openb=
mc-project.xyz/#/c/openbmc/phosphor-dbus-interfaces/+/16571/" target=3D"_bl=
ank">https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-dbus-interface=
s/+/16571/</a></div>
            <div><br>
            </div>
            <div>Looking for the inputs=C2=A0 on this=C2=A0 design flow and=
 any
              additional changes required from the security aspect on
              managing private keys in the BMC. <br>
            </div>
            <div>
              <ul>
                <li>The user performs the GenerateCSR action ( URIs:
                  /redfish/v1/CertificateService ) with required
                  parameters.</li>
                <ul>
                  <li>Certificate service provides a d-bus interface to
                    generate CSR .</li>
                  <ul>
                    <li>Certificate manager create Private key and saves
                      the service specific path <br>
                    </li>
                    <li>Returns the d-bus path for the newly created
                      CSR.</li>
                  </ul>
                </ul>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>I am hoping this design is wrt Redfish, which explains the
        flow to deploy CSR based certificate.</tt></p>
    <p><tt>I was little confused about d-bus interface terminology here,
        I understand that in redfish we have certificate service schema
        which has action</tt></p>
    <p><tt>GenerateCSR, I am assuming we are talking about the same.</tt><b=
r>
    </p>
    <p><tt>GenerateCSR should not return the d-bus Path however it
        should return the </tt><tt><span><span class=3D"gmail-m_-4306834406=
775087264objectBox gmail-m_-4306834406775087264objectBox-string"> URI of th=
e Certificate Collection where
            the certificate will be installed.</span></span></tt></p></div>=
</blockquote><div>@ratan Certificate manager design is services ( HTTPS Ser=
ver, LDAP client etc) . we don&#39;t need to get collection object based ur=
i here because BMC web is running from collection object context . The=C2=
=A0 d-bus object uri=C2=A0 mentioned here , just used to watch CSR is ready=
 and return info to redfish user.<br></div><div><br> </div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <p><tt>Does the GenerateCSR creates CSR resource which can be
        modifiable in future?<br>
      </tt></p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div>
              <ul>
                <ul>
                  <li>=C2=A0Certificate service provides d-bus interface to
                    download CSR</li>
                  <ul>
                    <li>=C2=A0The user need need wait for the creation of C=
SR
                      specific d-bus path to download the newly created
                      CSR</li>
                  </ul>
                </ul>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>Does the certificate service schema have the action Download
        CSR?</tt></p></div></blockquote><div>-No ,=C2=A0 Redfish GenerateCS=
R methods expect CSR text as output.<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <p><tt>I hope that response of GenerateCSR returns the CSR, There
        should not be another redfish call to get the CSR</tt>.<br></p></di=
v></blockquote><div>- Single call from Redfish point. <br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF"><p>
    </p>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div>
              <ul>
                <ul>
                  <li>=C2=A0The user takes the CSR file and get it signed b=
y
                    the appropriate authority.</li>
                  <ul>
                    <li>=C2=A0This step is outside the scope of Redfish.</l=
i>
                  </ul>
                </ul>
                <li>=C2=A0The user navigates to the appropriate certificate
                  collection</li>
                <ul>
                  <li>=C2=A0 Example: if trying to replace the HTTPS
                    certificate for a Manager, navigate to the Manager=E2=
=80=99s
                    Certificate Collection that is subordinate to the=C2=A0=
=C2=A0
                    NetworkProtocol/HTTPS object</li>
                </ul>
                <li>The user performs a POST on the Certificate
                  Collection with the certificate string in the body</li>
                <ul>
                  <li>=C2=A0Use the existing certificate upload d-bus
                    interface.</li>
                </ul>
                <li>Certificate manager validates the certificate with
                  the available service specific private keys in the
                  BMC.</li>
                <li>After successful validation=C2=A0 pairs the private key
                  used in the first step with the installed certificate.</l=
i>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>Would the implementation persist the CSR and associated
        private key for verification?</tt></p></div></blockquote><div>- yes=
.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div bgcolor=
=3D"#FFFFFF">
    <p><tt>I can understand that we can do the verification of
        public/private key through oprenssl function, but is there a
        possibility that user can change the CSR request(eg change the
        organization)</tt></p></div></blockquote><div>=C2=A0Redfish doesn&#=
39;t support this now , Any real use case for this?<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF">
    <p><tt>and get it signed and upload the certificate, How the
        implementation takes care of it?</tt></p>
    <p><tt>Now suppose user creates three CSR request and on the BMC we
        have three associated private keys and once user upload the
        certificate</tt></p>
    <p><tt>would the implementation starts matching the certificate
        public key with all the stored private keys and once it gets
        matched</tt></p>
    <p><tt>then the implementation creates the pairing?</tt><br>
    </p>
    <tt>How the certificates would be deleted?</tt></div></blockquote><div>=
<br></div><div>redfish supports only certificate replace. no delete , <br><=
/div><div>Planing to check with redfish community on this , this feature wi=
ll be useful for Authority type certificates.=C2=A0 <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div bgcolor=3D"#FFFFFF"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <div>Assumption:<br>
            </div>
            <ul>
              <li>For a service, BMC allows maximum 3 ( ?) CSR requests.
                Any new request after this will remove the oldest
                private key information from the BMC.</li>
              <li>User has to do a Factory removing=C2=A0 the private key
                from the system.</li>
            </ul>
          </div>
        </div>
      </div>
    </blockquote>
    <p><tt>Regards</tt></p>
    <p><tt>Ratan Gupta</tt><br>
    </p>
  </div>

</blockquote></div></div>

--000000000000840f0d0581e7f68f--
