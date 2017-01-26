Return-Path: <raltherr@google.com>
Received: from mail-io0-x22e.google.com (mail-io0-x22e.google.com
 [IPv6:2607:f8b0:4001:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v8Zzc4Z10zDq6X
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jan 2017 08:38:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JcrlRoXJ"; 
 dkim-atps=neutral
Received: by mail-io0-x22e.google.com with SMTP id v96so47484237ioi.0
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2017 13:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=m06ieJey9dbOJN8ds+epp43TeBvgQXFee6Gdq2keB7U=;
 b=JcrlRoXJfj4R/k5pUliHReQbjStBiJGtxVidPUNBt5Y5ADrQeJlWqmSybmXhuDkPT6
 55Y3NWM3yz5KEoBXr5d7Xchoh83uaL+M2y0jIIUZkFMAFn7ATPY3+yqTTnGFxc934C49
 +RdfCOIoJkKez7p0GLlJ2HJe4o2Hm9JjCC0NKwmP4ih8a3AkDf1yNT2TyDtRCjufMq1S
 t6iNS3Jq/Enh0LErnEat3ZJOFVrCE+0SCvq6Ezh1+qN6l/uhFbXxaT67IzKz5jL4v9J9
 ScrT18ek/GHvH1CeF+vCp6vZF+Qi1AL6Pmj3+qWJjWAzGZXpaEV9K3aEiXQnwKUIO9+c
 e3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=m06ieJey9dbOJN8ds+epp43TeBvgQXFee6Gdq2keB7U=;
 b=NhE4OYHvkxFi+oA2qHHpaLz8Y+DM9d/wcc7OXqEZgGhWhvbnMKRk9pS4q9p9WsUxWn
 bHkOjVr+JMoStBiGFZejPX4EjiI3MYfgCLb/fFbGb413p/vTc58VL4EIZs8wYIcoyLwv
 z3660WB7c943Vaj48OePrju15WUvq91lKH+AkQrlJ639uOHFvYoBxvJeygncVJi6Ih8A
 XFl7oSjE32n6UUXcqosw08l3Y1nsdLDW2JWgJ40g5DxYeT/yre1v/kV2U+Egt8oAo6Y9
 dmFtK3BxFSLGmLk0zu0gSTGkjbdo5cJZ4ACtPWLsZuRliy9sAcOTSe80QJZscQlKfMnw
 EZTQ==
X-Gm-Message-State: AIkVDXJtLzaf1SySkXs2dcokcPQUIw9t096Npu0YXYqvJWCPgAy1eSB4uSmP4GltprxfS+GMP9gbEsp/wDSHWNKe
X-Received: by 10.107.53.13 with SMTP id c13mr5236421ioa.55.1485466713440;
 Thu, 26 Jan 2017 13:38:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.130.106 with HTTP; Thu, 26 Jan 2017 13:38:32 -0800 (PST)
Received: by 10.107.130.106 with HTTP; Thu, 26 Jan 2017 13:38:32 -0800 (PST)
In-Reply-To: <1EDA4FEC-68CD-4215-AB90-3F087EEF3CA6@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <101001485427397@webcorp03h.yandex-team.ru>
 <1EDA4FEC-68CD-4215-AB90-3F087EEF3CA6@linux.vnet.ibm.com>
From: Rick Altherr <raltherr@google.com>
Date: Thu, 26 Jan 2017 13:38:32 -0800
Message-ID: <CAPLgG==G2mk-38bmxk_vxB_tOr33p3m7VJKuwVTu8F5qkdJBjw@mail.gmail.com>
Subject: Re: OpenBMC Image Management
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "Anton D. Kachalov" <mouse@yandex-team.ru>
Content-Type: multipart/alternative; boundary=001a11449e90c814bf0547062bdd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jan 2017 21:38:37 -0000

--001a11449e90c814bf0547062bdd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Applying patches makes for a security problem as well. Verifying integrity
and authenticity of the rootfs requires having trusted hashes. dm-verity
does this at a filesystem level. Patching individual binaries would
invalidate the signatures.

On Jan 26, 2017 7:36 AM, "Adriana Kobylak" <anoo@linux.vnet.ibm.com> wrote:

>
> On Jan 26, 2017, at 4:43 AM, Anton D. Kachalov <mouse@yandex-team.ru>
> wrote:
>
> Hello.
>
> 26.01.2017, 01:32, "Adriana Kobylak" <anoo@linux.vnet.ibm.com>:
>
> General:
> * Use CRAMFS for read-only partitions, and UBIFS for read-write partition=
s.
>
>
> Why CRAMFS? It's small, but supports only zlib compression, has a 16MB
> file size limitation and marked as obsolete in kernel tree. Why not
> SquashFS? It's better for larger projects, has a number of modern
> compression algos.
>
>
> You=E2=80=99re right Anton, typo mistake, it should be SquashFS, not CRAM=
FS.
>
>
> PNOR:
> * Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.bin in=
to a designated
> directory (/usr/local/ for example).
>
>
> Would it be good to add support for opkg-based packaging to incrementally
> (hotfix) system's update? I use it in OpenWRT.
>
>
> It is a good point, for this we=E2=80=99d need a read-write filesystem to=
 contain
> the code, and be more formal in updating the revision number in bitbake f=
or
> the images (currently is set to 0). But since our current use case is abo=
ut
> applying temporary (development) patches, not permanent fixes, these
> changes wouldn=E2=80=99t be a priority at the moment. Also for PNOR image=
s, we
> don=E2=80=99t own the packaging process (it=E2=80=99s done by the hostboo=
t build).
>
> As additional information, I=E2=80=99ll be sending a more detailed flow o=
f the
> PNOR update, including how the dbus objects in Patrick=E2=80=99s Software=
.Version
> yaml specification would fit, and how to create the virtual PNOR for the
> host (memory piece) that the mboxd will be interacting with.
>
>
> * Tool to write from PNOR image to BMC format. Implement UBI initially bu=
t
> it could be extended to support different volume managements on other BMC=
s.
>
> BMC:
> *Save multiple firmware versions, starting with 2, to provide the ability
> to roll-back if needed. If single BMC chip system, save both versions
> there. If two BMC chip system, save other version in 2nd chip.
> * Implement various levels of =E2=80=98persistency=E2=80=99, such as dev,=
 factory, field.
> Dev persistency would allow for local patches (/usr/local/ for example)
> that can be cleared before shipping to customers. Factory mode could dele=
te
> the location where user data such as network settings resides but preserv=
es
> the mac address and uuid for example. Etc.
>
> Thanks,
>
> Adriana
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>
> --
> Anton D. Kachalov
>
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
>
>

--001a11449e90c814bf0547062bdd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Applying patches makes for a security problem as well. Ve=
rifying integrity and authenticity of the rootfs requires having trusted ha=
shes. dm-verity does this at a filesystem level. Patching individual binari=
es would invalidate the signatures.</div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Jan 26, 2017 7:36 AM, &quot;Adriana Kobylak&quot=
; &lt;<a href=3D"mailto:anoo@linux.vnet.ibm.com">anoo@linux.vnet.ibm.com</a=
>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div st=
yle=3D"word-wrap:break-word"><br><div><blockquote type=3D"cite"><div>On Jan=
 26, 2017, at 4:43 AM, Anton D. Kachalov &lt;<a href=3D"mailto:mouse@yandex=
-team.ru" target=3D"_blank">mouse@yandex-team.ru</a>&gt; wrote:</div><br cl=
ass=3D"m_-6212822030987642468Apple-interchange-newline"><div><span style=3D=
"font-family:ArialUnicodeMS;font-size:12px;font-style:normal;font-variant-c=
aps:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;float:non=
e;display:inline!important">Hello.</span><br style=3D"font-family:ArialUnic=
odeMS;font-size:12px;font-style:normal;font-variant-caps:normal;font-weight=
:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transfo=
rm:none;white-space:normal;word-spacing:0px"><br style=3D"font-family:Arial=
UnicodeMS;font-size:12px;font-style:normal;font-variant-caps:normal;font-we=
ight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px"><span style=3D"font-family=
:ArialUnicodeMS;font-size:12px;font-style:normal;font-variant-caps:normal;f=
ont-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;float:none;display:in=
line!important">26.01.2017, 01:32, &quot;Adriana Kobylak&quot; &lt;</span><=
a href=3D"mailto:anoo@linux.vnet.ibm.com" style=3D"font-family:ArialUnicode=
MS;font-size:12px;font-style:normal;font-variant-caps:normal;font-weight:no=
rmal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px" target=3D"_blank">anoo@linux.vnet=
.ibm.com</a><span style=3D"font-family:ArialUnicodeMS;font-size:12px;font-s=
tyle:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;float:none;display:inline!important">&gt;:</span><br style=
=3D"font-family:ArialUnicodeMS;font-size:12px;font-style:normal;font-varian=
t-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px"><bloc=
kquote type=3D"cite" style=3D"font-family:ArialUnicodeMS;font-size:12px;fon=
t-style:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:n=
ormal;text-align:start;text-indent:0px;text-transform:none;white-space:norm=
al;word-spacing:0px">General:<br>* Use CRAMFS for read-only partitions, and=
 UBIFS for read-write partitions.<br></blockquote><br style=3D"font-family:=
ArialUnicodeMS;font-size:12px;font-style:normal;font-variant-caps:normal;fo=
nt-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px"><span style=3D"font-f=
amily:ArialUnicodeMS;font-size:12px;font-style:normal;font-variant-caps:nor=
mal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;float:none;displ=
ay:inline!important">Why CRAMFS? It&#39;s small, but supports only zlib com=
pression, has a 16MB file size limitation and marked as obsolete in kernel =
tree. Why not SquashFS? It&#39;s better for larger projects, has a number o=
f modern compression algos.</span><br style=3D"font-family:ArialUnicodeMS;f=
ont-size:12px;font-style:normal;font-variant-caps:normal;font-weight:normal=
;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none=
;white-space:normal;word-spacing:0px"></div></blockquote><div><br></div>You=
=E2=80=99re right Anton, typo mistake, it should be SquashFS, not CRAMFS.</=
div><div><br><blockquote type=3D"cite"><div><br style=3D"font-family:ArialU=
nicodeMS;font-size:12px;font-style:normal;font-variant-caps:normal;font-wei=
ght:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px"><blockquote type=3D"cite" s=
tyle=3D"font-family:ArialUnicodeMS;font-size:12px;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px">P=
NOR:<br>* Ability to =E2=80=98patch=E2=80=99 by copying a Hostboot image *.=
bin into a designated directory (/usr/local/ for example).<br></blockquote>=
<br style=3D"font-family:ArialUnicodeMS;font-size:12px;font-style:normal;fo=
nt-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px"><span style=3D"font-family:ArialUnicodeMS;font-size:12px;font-style:nor=
mal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;float:none;display:inline!important">Would it be good to add suppo=
rt for opkg-based packaging to incrementally (hotfix) system&#39;s update? =
I use it in OpenWRT.</span><br style=3D"font-family:ArialUnicodeMS;font-siz=
e:12px;font-style:normal;font-variant-caps:normal;font-weight:normal;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px"></div></blockquote><div><br></div>It is a go=
od point, for this we=E2=80=99d need a read-write filesystem to contain the=
 code, and be more formal in updating the revision number in bitbake for th=
e images (currently is set to 0). But since our current use case is about a=
pplying temporary (development) patches, not permanent fixes, these changes=
 wouldn=E2=80=99t be a priority at the moment. Also for PNOR images, we don=
=E2=80=99t own the packaging process (it=E2=80=99s done by the hostboot bui=
ld).</div><div><br></div><div>As additional information, I=E2=80=99ll be se=
nding a more detailed flow of the PNOR update, including how the dbus objec=
ts in Patrick=E2=80=99s Software.Version yaml specification would fit, and =
how to create the virtual PNOR for the host (memory piece) that the mboxd w=
ill be interacting with.</div><div><br><blockquote type=3D"cite"><div><br s=
tyle=3D"font-family:ArialUnicodeMS;font-size:12px;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px"><=
blockquote type=3D"cite" style=3D"font-family:ArialUnicodeMS;font-size:12px=
;font-style:normal;font-variant-caps:normal;font-weight:normal;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px">* Tool to write from PNOR image to BMC format. Imp=
lement UBI initially but it could be extended to support different volume m=
anagements on other BMCs.<br><br>BMC:<br>*Save multiple firmware versions, =
starting with 2, to provide the ability to roll-back if needed. If single B=
MC chip system, save both versions there. If two BMC chip system, save othe=
r version in 2nd chip.<br>* Implement various levels of =E2=80=98persistenc=
y=E2=80=99, such as dev, factory, field. Dev persistency would allow for lo=
cal patches (/usr/local/ for example) that can be cleared before shipping t=
o customers. Factory mode could delete the location where user data such as=
 network settings resides but preserves the mac address and uuid for exampl=
e. Etc.<br><br>Thanks,<br><br>Adriana<br>______________________________<wbr=
>_________________<br>openbmc mailing list<br><a href=3D"mailto:openbmc@lis=
ts.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a><br><a href=3D=
"https://lists.ozlabs.org/listinfo/openbmc" target=3D"_blank">https://lists=
.ozlabs.org/<wbr>listinfo/openbmc</a><br></blockquote><br style=3D"font-fam=
ily:ArialUnicodeMS;font-size:12px;font-style:normal;font-variant-caps:norma=
l;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px"><span style=3D"fo=
nt-family:ArialUnicodeMS;font-size:12px;font-style:normal;font-variant-caps=
:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;float:none;d=
isplay:inline!important">--<span class=3D"m_-6212822030987642468Apple-conve=
rted-space">=C2=A0</span></span><br style=3D"font-family:ArialUnicodeMS;fon=
t-size:12px;font-style:normal;font-variant-caps:normal;font-weight:normal;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px"><span style=3D"font-family:ArialUnicode=
MS;font-size:12px;font-style:normal;font-variant-caps:normal;font-weight:no=
rmal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;float:none;display:inline!importan=
t">Anton D. Kachalov</span></div></blockquote></div><br></div><br>_________=
_____________________<wbr>_________________<br>
openbmc mailing list<br>
<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a><br=
>
<a href=3D"https://lists.ozlabs.org/listinfo/openbmc" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lists.ozlabs.org/<wbr>listinfo/openbmc</a><br>
<br></blockquote></div></div>

--001a11449e90c814bf0547062bdd--
