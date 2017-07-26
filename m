Return-Path: <maxims@google.com>
Received: from mail-wr0-x22e.google.com (mail-wr0-x22e.google.com
 [IPv6:2a00:1450:400c:c0c::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xHmtR4H7szDrD0
 for <openbmc@lists.ozlabs.org>; Thu, 27 Jul 2017 06:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Q3gm9KHu"; 
 dkim-atps=neutral
Received: by mail-wr0-x22e.google.com with SMTP id y43so135959862wrd.3
 for <openbmc@lists.ozlabs.org>; Wed, 26 Jul 2017 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=xjCe61ODWWtriWmB6mO3nQ6BFgkzRRdJZNw4xsFd0gQ=;
 b=Q3gm9KHuriKa87r/dXXe/jz0xNgFr/2rnsrSyvJCUClD85tP7b66CkXFRNK28G4W8g
 h+BAcRZBNE9SDd2jSglvA3BUCdPWnbTFT8vAUaeVVs13tvNCFEPRqE9TyHQdiDGMjNkb
 V8qfrUGcozui140bgxwXvLfW936FWn3HXrmj7HZcyGYLal4c3cXRXE8T78UzkqYw0W01
 3a5S9Sha+ToPcl/aLurPEV7QRsUnWDILmv9yGlscktdZhZklgACid/KkiTqxKtFF2YYp
 omgo+YvgNJZkrrXjdNH/Vm452w+2Xqkm+212rTWx1Z8GQPxVWhWvHDmkdth6sySetQ4f
 Ppfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=xjCe61ODWWtriWmB6mO3nQ6BFgkzRRdJZNw4xsFd0gQ=;
 b=f9ebYXEv67JCYMKfw2yVmePdi85dViq68DQ3eCIZeh7LtSMGcdB6cQsYKAcRr1sV6C
 E/MldaZxvBCrp+PcfNG83rvZCHVeeiXESY+UDjxYrjx2X7kqHC0jqEbcoO35F9J2k4sc
 vx+2jh5UJd9CvLod5g2Kus1hFnQPpfjnpV6JIfAjAsUW+g1y9OEYJ7ARZZcMhrmwGOLp
 mV0RjKdA8wVzG215wLPk4i0JQBMO/sQlga7WBkcnawTzq5Psw52dWuVxFkPbKl37Orkf
 ymVACApu3oRS5AAfYPjwmrHjhYf0nhAB48vTVXuHDp0581nTiXjokyjr39/gLb+SNlcB
 aRlw==
X-Gm-Message-State: AIVw111XqGVUF7/epnE+BFoK0Eg0V/qPP3HqVP9Mzb4P3trzvgRjrXvB
 xqPoamMWneiFZaI87MSoJLJSuWweNWKs7RU=
X-Received: by 10.223.172.137 with SMTP id o9mr1718684wrc.275.1501100972075;
 Wed, 26 Jul 2017 13:29:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.229.76 with HTTP; Wed, 26 Jul 2017 13:29:31 -0700 (PDT)
In-Reply-To: <CAPLgG==VR2Hkxg-VbP-c=TpH7AExG1KHraWzg5Xf=-j6z8Ebbw@mail.gmail.com>
References: <20170721223326.28674-1-patrick@stwcx.xyz>
 <CAPLgG==ZSsfgAm38616-32W5P6vZJsKJ+e8-XfhPxK3CVvVDmw@mail.gmail.com>
 <20170725224224.GB473@asimov.austin.ibm.com>
 <CAPLgG==VR2Hkxg-VbP-c=TpH7AExG1KHraWzg5Xf=-j6z8Ebbw@mail.gmail.com>
From: Maxim Sloyko <maxims@google.com>
Date: Wed, 26 Jul 2017 13:29:31 -0700
Message-ID: <CAFR_W8oo2rF1--rscUhxgwGn70ei44u-1s=nPsztOxqq2qdwgw@mail.gmail.com>
Subject: Re: [PATCH u-boot 0/1] RFC: How to configure boot options?
To: Rick Altherr <raltherr@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="001a11477cb6377f4605553e4e9c"
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
X-List-Received-Date: Wed, 26 Jul 2017 20:29:36 -0000

--001a11477cb6377f4605553e4e9c
Content-Type: text/plain; charset="UTF-8"

All those options (bootcmd, bootargs) can be configured through the
environment, which is left blank in current image.

As a separate step in image-overlay:do_generate_flash one can generate and
populate that environment (using mkenvimage from u-boot-mkimage package)
using simple text file as a source.

U-Boot source code just needs to provide sensible defaults.

On Tue, Jul 25, 2017 at 7:42 PM, Rick Altherr <raltherr@google.com> wrote:

> I could see those as IMAGE_FEATURES. FIT vs non-FIT is controlled by
> KERNAL_IMAGETYPE but that could be triggered by IMAGE_FEATURES. Regardless
> of the options chosen, the built U-Boot should support booting the current
> FIT+initramfs+cpio and a future FIT+UBI at least for the transition period.
>
> On Jul 25, 2017 3:42 PM, "Patrick Williams" <patrick@stwcx.xyz> wrote:
>
>> On Mon, Jul 24, 2017 at 11:19:52AM -0700, Rick Altherr wrote:
>> > The current bootcmd script is there to provide backward compatibility
>> for
>> > pre-FIT ramdisks.  That can probably be removed but we now want fallback
>> > behavior for images that still use a ramdisk.
>>
>> Thanks for giving me the history on that BOOTCOMMAND snippet.  It wasn't
>> obvious what it was doing to me.
>>
>> Agreed.  It seems a little odd to me that this is all controlled in the
>> u-boot repository directly, hence my questions.  I would have expected
>> that an IMAGE_FEATURE or MACHINE_FEATURE of Yocto would have triggered
>> FIT vs non-FIT.  Same now with the transition to UBI with kernel and
>> squashfs instead of distinct MTD devices.
>>
>> >
>> > On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams <patrick@stwcx.xyz>
>> wrote:
>> >
>> > > As part of the change-over from an initramfs-based boot sequence to a
>> > > direct rootfs boot, we need to change some of the boot options for
>> > > u-boot.  I expect these to change a few times in the near future as we
>> > > also transition to UBI-managed volumes and we figure out how to set
>> > > u-boot environment options to switch between different UBI kernels and
>> > > rootfses.
>> > >
>> > > This is really independent from the current ast-*-defconfigs, in that
>> > > those currently select between different network options.  I suspect
>> > > we do not N*M combinations of defconfigs for network*image-structure.
>> > > I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake to
>> > > control this, but looking for feedback on how we should change u-boot.
>> > >
>> > > Ideally, to me, this would have been passed in via the config file and
>> > > we could have used config-snippets in Yocto like we do for the kernel.
>> > > Due to the way u-boot builds, I could not find a simple way to even
>> > > change this option from a include/config/ast-common.h #define into a
>> > > machine_config driven option.
>> > >
>> > > Anyone have ideas?
>> > >
>> > > Patrick Williams (1):
>> > >   config/ast-common: hack bootopts
>> > >
>> > >  include/configs/ast-common.h | 6 ++++++
>> > >  1 file changed, 6 insertions(+)
>> > >
>> > > --
>> > > 2.13.0
>> > >
>> > >
>> > >
>>
>> --
>> Patrick Williams
>>
>


-- 
*M*axim *S*loyko

--001a11477cb6377f4605553e4e9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All those options (bootcmd, bootargs) can be configured th=
rough the environment, which is left blank in current image.<div><br></div>=
<div>As a separate step in image-overlay:do_generate_flash one can generate=
 and populate that environment (using mkenvimage from u-boot-mkimage packag=
e) using simple text file as a source.</div><div><br></div><div>U-Boot sour=
ce code just needs to provide sensible defaults.</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 25, 2017 at 7:42 PM,=
 Rick Altherr <span dir=3D"ltr">&lt;<a href=3D"mailto:raltherr@google.com" =
target=3D"_blank">raltherr@google.com</a>&gt;</span> wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"auto">I could see those as IMAGE_FEATURES. F=
IT vs non-FIT is controlled by KERNAL_IMAGETYPE but that could be triggered=
 by IMAGE_FEATURES. Regardless of the options chosen, the built U-Boot shou=
ld support booting the current FIT+initramfs+cpio and a future FIT+UBI at l=
east for the transition period.</div><div class=3D"HOEnZb"><div class=3D"h5=
"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Jul 25, 2017=
 3:42 PM, &quot;Patrick Williams&quot; &lt;<a href=3D"mailto:patrick@stwcx.=
xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br type=3D"attribut=
ion"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Mon, Jul 24, 2017 at 11:19:52AM -070=
0, Rick Altherr wrote:<br>
&gt; The current bootcmd script is there to provide backward compatibility =
for<br>
&gt; pre-FIT ramdisks.=C2=A0 That can probably be removed but we now want f=
allback<br>
&gt; behavior for images that still use a ramdisk.<br>
<br>
Thanks for giving me the history on that BOOTCOMMAND snippet.=C2=A0 It wasn=
&#39;t<br>
obvious what it was doing to me.<br>
<br>
Agreed.=C2=A0 It seems a little odd to me that this is all controlled in th=
e<br>
u-boot repository directly, hence my questions.=C2=A0 I would have expected=
<br>
that an IMAGE_FEATURE or MACHINE_FEATURE of Yocto would have triggered<br>
FIT vs non-FIT.=C2=A0 Same now with the transition to UBI with kernel and<b=
r>
squashfs instead of distinct MTD devices.<br>
<br>
&gt;<br>
&gt; On Fri, Jul 21, 2017 at 3:33 PM, Patrick Williams &lt;<a href=3D"mailt=
o:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; As part of the change-over from an initramfs-based boot sequence =
to a<br>
&gt; &gt; direct rootfs boot, we need to change some of the boot options fo=
r<br>
&gt; &gt; u-boot.=C2=A0 I expect these to change a few times in the near fu=
ture as we<br>
&gt; &gt; also transition to UBI-managed volumes and we figure out how to s=
et<br>
&gt; &gt; u-boot environment options to switch between different UBI kernel=
s and<br>
&gt; &gt; rootfses.<br>
&gt; &gt;<br>
&gt; &gt; This is really independent from the current ast-*-defconfigs, in =
that<br>
&gt; &gt; those currently select between different network options.=C2=A0 I=
 suspect<br>
&gt; &gt; we do not N*M combinations of defconfigs for network*image-struct=
ure.<br>
&gt; &gt; I plan to make a MACHINE_FEATURE (or DISTRO_FEATURE) in bitbake t=
o<br>
&gt; &gt; control this, but looking for feedback on how we should change u-=
boot.<br>
&gt; &gt;<br>
&gt; &gt; Ideally, to me, this would have been passed in via the config fil=
e and<br>
&gt; &gt; we could have used config-snippets in Yocto like we do for the ke=
rnel.<br>
&gt; &gt; Due to the way u-boot builds, I could not find a simple way to ev=
en<br>
&gt; &gt; change this option from a include/config/ast-common.h #define int=
o a<br>
&gt; &gt; machine_config driven option.<br>
&gt; &gt;<br>
&gt; &gt; Anyone have ideas?<br>
&gt; &gt;<br>
&gt; &gt; Patrick Williams (1):<br>
&gt; &gt;=C2=A0 =C2=A0config/ast-common: hack bootopts<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 include/configs/ast-common.h | 6 ++++++<br>
&gt; &gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.13.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
--<br>
Patrick Williams<br>
</blockquote></div></div>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div><b>M=
</b>axim <b>S</b>loyko</div></div>
</div>

--001a11477cb6377f4605553e4e9c--
