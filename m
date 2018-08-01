Return-Path: <ojayanth@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::22f; helo=mail-ua0-x22f.google.com;
 envelope-from=ojayanth@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NJfhsfTI"; 
 dkim-atps=neutral
Received: from mail-ua0-x22f.google.com (mail-ua0-x22f.google.com
 [IPv6:2607:f8b0:400c:c08::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41gVtK2jMYzF10S
 for <openbmc@lists.ozlabs.org>; Wed,  1 Aug 2018 21:08:57 +1000 (AEST)
Received: by mail-ua0-x22f.google.com with SMTP id r10-v6so12394384uao.1
 for <openbmc@lists.ozlabs.org>; Wed, 01 Aug 2018 04:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pAdWUG9YpT+dGX4zXPVxkK7gjV1mCLflufG++3nivVU=;
 b=NJfhsfTIhA1ddEebBP9HnFqozT8D+FoMFRt4rF3Yk2PWGRA30Yy8MvmnbQ6u7mSLkQ
 9015mKE1SdhT8ukKqN2A/XIalGxRgPRMBERoBQdoFdh4Ocw7BouVhZr7EVgZOEl0xj6n
 QaEmFO/UmC0jnosnxPH/MdANl9598/aTRlTPaLzHQT+JkA2RG+CUe0zKROQOBi1AD5/z
 pnUIg58P73svC9caboPeAh4FuHKC+FOag0KcHk8JLvTIycWRR0LzuF0+4+SIuAQcjVSY
 pXTseaWXOAXlmM8mh6z0TrrqyT1Znr1JbfHQ5NoUSh2GC3jQkJmczai6+iHmdAZSvb6V
 Ft1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAdWUG9YpT+dGX4zXPVxkK7gjV1mCLflufG++3nivVU=;
 b=Sighq/6hYY7T7Pjz5Isg9lTV4trec9A0xrTTzKVyf9GErswHli/CSqs2GPJkd/MwIh
 Qn06w+5YOgywjQdTu3cAAt5OBDfls4UzP06YsGVliSo8XJJ90PdDcwvAuL3Cu0a2byke
 H9dTU76EdtqX7z5p6vWoknPQFbg4fpDSfkFmdezuOQG9j8Qpa1CO0Evs/XS4IhYtfVO9
 urLFmzOvqYbfPAlPTNsze2935zwSAah7GiTnsKLZx2gQ9FId/z1aduc9VemGjp8BCapN
 6yqCpqcGqqiThatZlDhpX7eECJpp9dOxqBnmdSUGFO9RHCvjjy72gKFkKHjFAoBFOCFW
 3wpg==
X-Gm-Message-State: AOUpUlGZQjOcjjGnMSkrmDiek1H9Y1zDWIj1J6iAHI/7plUBgVaSgnj6
 YiYOYjZJSsyCX1kvQd+RqARzYst/x9AGKBHNdiE=
X-Google-Smtp-Source: AAOMgpfOHe51mUvtxtYVLc5S6xrYrjsxAnfEOUFfkb3fdxdJ2UCRqWXCuVi5gR2xjh2/m5iCOyzjtg4FW7T+dvVw78E=
X-Received: by 2002:ab0:2602:: with SMTP id
 c2-v6mr17681905uao.127.1533121730332; 
 Wed, 01 Aug 2018 04:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <CACkAXSrxyf819dQc+LEOfwahpcrK2QRH1AkXump-D9Ae+yaKBQ@mail.gmail.com>
 <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
In-Reply-To: <1d63a4ec-1902-c9d3-13d8-94ef7e437425@intel.com>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Wed, 1 Aug 2018 16:38:37 +0530
Message-ID: <CACkAXSrj1X+EkuUwbOQb3C+OCe_kSaN8zfvWdL32s0=_Ji248g@mail.gmail.com>
Subject: Re: SSL Certificate management proposal.
To: ed.tanous@intel.com
Cc: openbmc@lists.ozlabs.org, bradleyb@fuzziesquirrel.com
Content-Type: multipart/alternative; boundary="000000000000224b1d05725db856"
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
X-List-Received-Date: Wed, 01 Aug 2018 11:08:59 -0000

--000000000000224b1d05725db856
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 31, 2018 at 11:21 PM Ed Tanous <ed.tanous@intel.com> wrote:
>
> On 07/31/2018 07:49 AM, Jayanth Othayoth wrote:
> >
> > The workflow for updating a signed certificate on the BMC consists of:
> > 1. Generating a CSR on the BMC
> > 2. Exporting the CSR from the BMC onto the user=E2=80=99s storage devic=
e
> > 3. Obtaining a singed certificate corresponding to the CSR from a CA
> > 4. Importing the signed certificate on the BMC
> >
>
> This workflow is somewhat of a non starter for a lot of organizations
> and IT departments.  First, it requires that every BMC have its own
> private key, which isn't always desired.
> Second, it means that you either have to be able to specify all
> parameters that a user would want to specify about his key (number of
> bits, EC vs RSA, ect).
> Third, it requires that every BMC be provisioned by the intermediate
> authority, which can be difficult if keys either have a cost associated
> with them, or are difficult to acquire.
>

> I would vote that we should start with the key and certificate upload
> flows, as they are far simpler to implement, and better understood in
> practice then try to go after the BMC CSR implementation if it's still
> required.
>
Agree with your concern, but from the security standpoint transmitting
private key over network is not recommended.  Additionally a simplified
method also can be provided for customers who wants that.
> >
> > Additional Requirements:
> >
> >   * BMC should store the Signed certificate and private key in a
> >     persistent secured storage location..
>
> What does this mean exactly?  Encrypted disk backed by hardware
> security?  Is it just implying file system permissions?
Storage method can be varied based on the implementation. Curenlty looking
at file system permissions.
>
> >   * Activate process shall validate the new certificate against the
> >     private key and information in the CSR.
> You don't really define what the "activate process" is in this context.
> I suspect you're talking about a process designed for cert upload, but
> I'm not really sure given the context.
>
Upload process just save the Signed certificate in a  BMC location and
"activation" will replace the curently used certificate in the secured
location and restart all the impacted services.
> >   * Successful certificate activation shall replace the existing
> >     certificate and private key.
> >   * A new CSR generate request will overwrite the previous CSR. User
> >     should take caution to not repeat CSR requests to prevent
> >     overwriting pending CSRs.
>
> If you're going after a CSR flow, I don't think you can do this to a
> user.  Having a CSR immediately overwrite would mean that it invalidated
> the old one, and you have a period of time where your BMC interfaces are
> down while you request a new certificate from your intermediate authority=
.
>
As mentioned earlier  curently used certificate will be replaced only after
the successful activation. So there wont be any downtime during CSR
creation process.
> >   * Certificate management operation should be restricted for certain
> >     privilege levels.
>
> Which privilege levels?  This requirement should be more specific.
>
User privilege level need to be discussed more.
> >   * As part of Boot process,  a new self-signed certificate is
generated if:
> >
> >   * No CA signed certificate is present or corrupted.
> >   * A self-signed certificate is not present or corrupted.
>
> Agree with these two, and I believe this is how all the web clients
> currently work.
>
> >   * The certificate has expired.
> Disagree with this one.  If the certificate has expired AND it was a
> self signed cert, it could be replaced, but it doesn't happen much in
> practice, as self signed certs usually have a very long validity period
> (10 years or more).
> If a certificate that a user has uploaded expired, it should be left
> expired until the user decides to replace it.  We shouldn't be changing
> keys and certificates seemingly randomly or automatically.
> There's also a question of how you determine if a certificate is
> "expired".  There are no guarantees that the BMC clock is accurate at
> all times, and the potential race conditions in supporting this outweigh
> the benefit.

Agreed.
> >
> >   * Validity of the certificate must be ensured by the user or client
> >     application by periodically checking the expiry date. Certificate
> >     management feature may be be enhanced in future to generate events
> >     when the certificate is about to expire.
> >
> >   * Existing REST session will be tossed during certificate activate
> >     process.
> I assume you mean restarted?  I would word this requirement a little
> differently.
>
> * While the web services may restart to begin using the new certificate,
> it shall not interrupt any update flows, and return codes returned by
> all interfaces shall be correct.
>
Agreed.
> >
> >
> > Note: REST/D-bus details not included here.

--000000000000224b1d05725db856
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Tue, Jul 31, 2018 at 11:21 PM Ed Tanous &lt;<a hre=
f=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.tanous@intel.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; On 07/31/2018 07:49 AM, Jayanth Othayoth wrote:<br>
&gt; &gt;<br>
&gt; &gt; The workflow for updating a signed certificate on the BMC consist=
s of:<br>
&gt; &gt; 1. Generating a CSR on the BMC<br>
&gt; &gt; 2. Exporting the CSR from the BMC onto the user=E2=80=99s storage=
 device<br>
&gt; &gt; 3. Obtaining a singed certificate corresponding to the CSR from a=
 CA<br>
&gt; &gt; 4. Importing the signed certificate on the BMC<br>
&gt; &gt;<br>
&gt;<br>
&gt; This workflow is somewhat of a non starter for a lot of organizations<=
br>
&gt; and IT departments.=C2=A0 First, it requires that every BMC have its o=
wn<br>
&gt; private key, which isn&#39;t always desired.<br>
&gt; Second, it means that you either have to be able to specify all<br>
&gt; parameters that a user would want to specify about his key (number of<=
br>
&gt; bits, EC vs RSA, ect).<br>
&gt; Third, it requires that every BMC be provisioned by the intermediate<b=
r>
&gt; authority, which can be difficult if keys either have a cost associate=
d<br>
&gt; with them, or are difficult to acquire.<br>
&gt;<br><br>
&gt; I would vote that we should start with the key and certificate upload<=
br>
&gt; flows, as they are far simpler to implement, and better understood in<=
br>
&gt; practice then try to go after the BMC CSR implementation if it&#39;s s=
till<br>
&gt; required.<br>
&gt;<br>Agree with your concern, but from the security standpoint transmitt=
ing=20
private key over network is not recommended.=C2=A0 Additionally a simplifie=
d=20
method also can be provided for customers who wants that.<br>
&gt; &gt;<br>
&gt; &gt; Additional Requirements:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0* BMC should store the Signed certificate and private=
 key in a<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0persistent secured storage location..<br>
&gt;<br>
&gt; What does this mean exactly?=C2=A0 Encrypted disk backed by hardware<b=
r>
&gt; security?=C2=A0 Is it just implying file system permissions?<br></div>=
Storage method can be varied based on the implementation. Curenlty looking =
at file system permissions.<br><div>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0* Activate process shall validate the new certificate=
 against the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0private key and information in the CSR.<br>
&gt; You don&#39;t really define what the &quot;activate process&quot; is i=
n this context.<br>
&gt; I suspect you&#39;re talking about a process designed for cert upload,=
 but<br>
&gt; I&#39;m not really sure given the context.<br>
&gt;<br>Upload process just save the Signed certificate in a=C2=A0 BMC loca=
tion and &quot;activation&quot; will replace the curently used certificate =
in the secured location and restart all the impacted services. <br>
&gt; &gt;=C2=A0 =C2=A0* Successful certificate activation shall replace the=
 existing<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0certificate and private key.<br>
&gt; &gt;=C2=A0 =C2=A0* A new CSR generate request will overwrite the previ=
ous CSR. User<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0should take caution to not repeat CSR requests=
 to prevent<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0overwriting pending CSRs.<br>
&gt;<br>
&gt; If you&#39;re going after a CSR flow, I don&#39;t think you can do thi=
s to a<br>
&gt; user.=C2=A0 Having a CSR immediately overwrite would mean that it inva=
lidated<br>
&gt; the old one, and you have a period of time where your BMC interfaces a=
re<br>
&gt; down while you request a new certificate from your intermediate author=
ity.<br>
&gt;<br>As mentioned earlier=C2=A0 curently used certificate will be replac=
ed only after the successful activation. So there wont be any downtime duri=
ng CSR creation process.<br>
&gt; &gt;=C2=A0 =C2=A0* Certificate management operation should be restrict=
ed for certain<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0privilege levels.<br>
&gt;<br>
&gt; Which privilege levels?=C2=A0 This requirement should be more specific=
.<br>
&gt;<br>User privilege level need to be discussed more.<br>
&gt; &gt;=C2=A0 =C2=A0* As part of Boot process,=C2=A0 a new self-signed ce=
rtificate is generated if:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0* No CA signed certificate is present or corrupted.<b=
r>
&gt; &gt;=C2=A0 =C2=A0* A self-signed certificate is not present or corrupt=
ed.<br>
&gt;<br>
&gt; Agree with these two, and I believe this is how all the web clients<br=
>
&gt; currently work.<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0* The certificate has expired.<br>
&gt; Disagree with this one.=C2=A0 If the certificate has expired AND it wa=
s a<br>
&gt; self signed cert, it could be replaced, but it doesn&#39;t happen much=
 in<br>
&gt; practice, as self signed certs usually have a very long validity perio=
d<br>
&gt; (10 years or more).<br>
&gt; If a certificate that a user has uploaded expired, it should be left<b=
r>
&gt; expired until the user decides to replace it.=C2=A0 We shouldn&#39;t b=
e changing<br>
&gt; keys and certificates seemingly randomly or automatically.<br>
&gt; There&#39;s also a question of how you determine if a certificate is<b=
r>
&gt; &quot;expired&quot;.=C2=A0 There are no guarantees that the BMC clock =
is accurate at<br>
&gt; all times, and the potential race conditions in supporting this outwei=
gh<br>
&gt; the benefit.<br></div><div><br></div><div>Agreed.<br></div><div>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0* Validity of the certificate must be ensured by the =
user or client<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0application by periodically checking the expir=
y date. Certificate<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0management feature may be be enhanced in futur=
e to generate events<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0when the certificate is about to expire.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0* Existing REST session will be tossed during certifi=
cate activate<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0process.<br>
&gt; I assume you mean restarted?=C2=A0 I would word this requirement a lit=
tle<br>
&gt; differently.<br>
&gt;<br>
&gt; * While the web services may restart to begin using the new certificat=
e,<br>
&gt; it shall not interrupt any update flows, and return codes returned by<=
br>
&gt; all interfaces shall be correct.<br>
&gt;<br></div><div>Agreed.<br></div><div>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Note: REST/D-bus details not included here.</div></div>

--000000000000224b1d05725db856--
