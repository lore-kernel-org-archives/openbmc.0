Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:400c:c09::230; helo=mail-wm0-x230.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gQDomBge"; 
 dkim-atps=neutral
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Br5H63wqzDqph
 for <openbmc@lists.ozlabs.org>; Fri, 30 Mar 2018 03:37:39 +1100 (AEDT)
Received: by mail-wm0-x230.google.com with SMTP id a20so30988045wmd.1
 for <openbmc@lists.ozlabs.org>; Thu, 29 Mar 2018 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xrMMVyjmLfVdHj4BhoXyL4NSnCCdO+PdPejWYdwepHU=;
 b=gQDomBgeUzblZc/IrKQ5+zYNYxpMbeo2Zxt4QfxbXs7Ru/TUyyNXK4s1kBgIdMDKgn
 k2IhBkTViXk17HreCT5NoNYvE712Vd8KqyNTy9xlcIat9+D8WZLUq7q97UG9WqlW08Ah
 ZmhALdzxmFVhYgt7COXjh8FRx8WWTJYoLB5aLKkwpN5S3HQzTmnCXLigYMF0bnWQThP+
 USn1hZUjVSctlq+CjX2ZFc6QqKc1xJOGil52bpd1wWFElMm76MmVYV3F8ace7r91cynd
 58Z2YD6BBb3MSZvz0xUbF3imjBbWgjOXl4YHF80fqktXQYoq6eaaRBxAWRc6zH9LMj/E
 NGhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xrMMVyjmLfVdHj4BhoXyL4NSnCCdO+PdPejWYdwepHU=;
 b=AnxRPrqZ62uPYbo/Cn8WS/0FV5YzwMlmFV4/nhiD82OVolKbTT5ewgMBlO4hEBG6mA
 Q4V7+EnsXfCD4rDXSfKKO5i06n0P15Js1pUaPqIA13A5IeIRIsNgNka2f8jevOA2aOwY
 ovrr/C2YYoGJY6M+QTK9Lwul1l5Ma3F8mNVfnuk5Ye7GyZv1GWcp+OFRCnRJvQvFWGDT
 Zo7l8+4r7FlmF6NQHIzv2c1ga4qQwWCLR5YyMyqR0Gyjs9MXs/b766FA6WIG/EFe4CS6
 v55yt7hk/6YtJ7AIWK681D89eyOo1CxIjtmc8OYn9zolYVzsCrJ+WJhL1fPVKz5kj2JV
 3h0w==
X-Gm-Message-State: AElRT7FRziuSRWfdDGQ/LVSF8A/2yNbtGWmx7l5AUSw0/PlpkDKsZLpc
 I0cLqOPUUoyOfl7O+hCz4QEt33jmmcCtAp+KUfcqdA==
X-Google-Smtp-Source: AIpwx48sE4exF0AxF1iWp2TRuCWDmeuHAuMq3Bz5NjXc80l6iWEb9v9bQpmOqeT9F2m8nenn7eKzJ3VI6FFhxwNTawQ=
X-Received: by 10.28.178.136 with SMTP id b130mr6957904wmf.68.1522341455359;
 Thu, 29 Mar 2018 09:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <d58f47d2-310c-f6cb-1ef0-6f7cae9bf7c0@linux.vnet.ibm.com>
 <4333c25f-d5bb-e4b8-f6c4-62deb53362a1@linux.vnet.ibm.com>
 <20180329161612.GA1946@cinnamon>
In-Reply-To: <20180329161612.GA1946@cinnamon>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Thu, 29 Mar 2018 16:37:24 +0000
Message-ID: <CAJoAoZ=KHfsjEmzYVMB=U8Pe+ioj6L6BPqxXwNvdHTY5LUZVmQ@mail.gmail.com>
Subject: Re: Attention users of network IPMI
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11444914aced2605688fbdf9"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Mar 2018 16:37:40 -0000

--001a11444914aced2605688fbdf9
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 9:19 AM Alexander Amelkin <a.amelkin@yadro.com>
wrote:

> On Thu, Mar 29, 2018 at 06:56:00PM +0530, Deepak Kodihalli wrote:
> > On 29/03/18 2:53 pm, Tom Joseph wrote:
> > >Hello,
> > >
> > >Based on  feedback from the team writing management scripts for OpenBMC.
> > >There is a suggestion to
> > >support the "-U" parameter when running the IPMI over network, to keep
> the
> > >script consistent across
> > >multiple BMC implementations.
> > >
> > >The support currently in  OpenBMC for the IPMI user accounts is the
> > >nameless account and the -U option
> > >is not needed and only the -P option is needed. With the proposed
> change,
> > >"-U admin" is needed, for the
> >
> > This would break current users based on a nameless account. So I suppose
> > that you'd have to still support a nameless account.
>
> Sure. IPMI specification clearly states for Set User Access command that
> "if implemented, this command must support at least the null user".
>
> > >session setup to succeed. "root"  username was not preferred so that the
> > >user does not get confused with the
> > >linux user account.
> > >
> > >IPMITool usage with the proposed change:
> > >
> > >ipmitool -I lanplus -H x.x.x.x -U admin -P 0penBmc <cmd>
>
> Just a note. IMO, the password for IPMI users must be the same as for
> system users, and preferably verified using pam as well.
>

Seconded - I'd probably suggest PAM as a bare minimum..


>
> IPMI defines user privileges (user, operator, administrator, oem
> prooprietary privileges), and I think we need to support them. I'd do that
> via
> standard user groups.  The root username may still be available with
> 'administrator' privilege level (user 'root' included into 'admin' group).
> That way we can rely on standard means for authentication and filesystem
> permissions, and maybe have some pam plugin for interaction with phosphor
> (e.g. to check whether a user is disabled).
>

I thought Intel (Ed?) was working on something related to this.  Could
someone comment?


>
> I'd also say that Get Device ID must work without password for anonymous
> user for ease of IPMI-enabled device discovery, but that again may break
> the existing setups using anonymous user with a password, and I can't find
> anything in IPMI v2.0 specification on authentication requirements for Get
> Device ID (if I was writing the spec, I'd demand absence of authentication
> for that command).
>
> Alexander.
>

--001a11444914aced2605688fbdf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu=
, Mar 29, 2018 at 9:19 AM Alexander Amelkin &lt;<a href=3D"mailto:a.amelkin=
@yadro.com">a.amelkin@yadro.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Thu, Mar 29, 2018 at 06:56:00PM +0530, Deepak Kodihalli wr=
ote:<br>
&gt; On 29/03/18 2:53 pm, Tom Joseph wrote:<br>
&gt; &gt;Hello,<br>
&gt; &gt;<br>
&gt; &gt;Based on=C2=A0 feedback from the team writing management scripts f=
or OpenBMC.<br>
&gt; &gt;There is a suggestion to<br>
&gt; &gt;support the &quot;-U&quot; parameter when running the IPMI over ne=
twork, to keep the<br>
&gt; &gt;script consistent across<br>
&gt; &gt;multiple BMC implementations.<br>
&gt; &gt;<br>
&gt; &gt;The support currently in=C2=A0 OpenBMC for the IPMI user accounts =
is the<br>
&gt; &gt;nameless account and the -U option<br>
&gt; &gt;is not needed and only the -P option is needed. With the proposed =
change,<br>
&gt; &gt;&quot;-U admin&quot; is needed, for the<br>
&gt;<br>
&gt; This would break current users based on a nameless account. So I suppo=
se<br>
&gt; that you&#39;d have to still support a nameless account.<br>
<br>
Sure. IPMI specification clearly states for Set User Access command that<br=
>
&quot;if implemented, this command must support at least the null user&quot=
;.<br>
<br>
&gt; &gt;session setup to succeed. &quot;root&quot;=C2=A0 username was not =
preferred so that the<br>
&gt; &gt;user does not get confused with the<br>
&gt; &gt;linux user account.<br>
&gt; &gt;<br>
&gt; &gt;IPMITool usage with the proposed change:<br>
&gt; &gt;<br>
&gt; &gt;ipmitool -I lanplus -H x.x.x.x -U admin -P 0penBmc &lt;cmd&gt;<br>
<br>
Just a note. IMO, the password for IPMI users must be the same as for<br>
system users, and preferably verified using pam as well.<br></blockquote><d=
iv><br></div><div>Seconded - I&#39;d probably suggest PAM as a bare minimum=
..</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
IPMI defines user privileges (user, operator, administrator, oem<br>
prooprietary privileges), and I think we need to support them. I&#39;d do t=
hat via<br>
standard user groups.=C2=A0 The root username may still be available with<b=
r>
&#39;administrator&#39; privilege level (user &#39;root&#39; included into =
&#39;admin&#39; group).<br>
That way we can rely on standard means for authentication and filesystem<br=
>
permissions, and maybe have some pam plugin for interaction with phosphor<b=
r>
(e.g. to check whether a user is disabled).<br></blockquote><div><br></div>=
<div>I thought Intel (Ed?) was working on something related to this.=C2=A0 =
Could someone comment?</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>
<br>
I&#39;d also say that Get Device ID must work without password for anonymou=
s<br>
user for ease of IPMI-enabled device discovery, but that again may break<br=
>
the existing setups using anonymous user with a password, and I can&#39;t f=
ind<br>
anything in IPMI v2.0 specification on authentication requirements for Get<=
br>
Device ID (if I was writing the spec, I&#39;d demand absence of authenticat=
ion<br>
for that command).<br>
<br>
Alexander.<br></blockquote><div>=C2=A0</div></div></div>

--001a11444914aced2605688fbdf9--
