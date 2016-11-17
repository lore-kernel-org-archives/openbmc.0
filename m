Return-Path: <abhishekpandit@google.com>
Received: from mail-vk0-x229.google.com (mail-vk0-x229.google.com
 [IPv6:2607:f8b0:400c:c05::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK2yg20Y6zDvpp
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 12:06:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AFTOkxOx"; 
 dkim-atps=neutral
Received: by mail-vk0-x229.google.com with SMTP id w194so129749844vkw.2
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 17:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qhl6Zl2Xiee6O0lgUUMvOSsCyF3jSpeG9tyWvTBlYXs=;
 b=AFTOkxOxkj+QOiHWTZ9SZe1w4V4KOCTucVJ0LDCd3bpDezDx5zFGowC8hYhuqHJLWl
 Xbb87UioXryJVqpesCEUOLJyqcP2WO1/rTFjmuUbLFWsTGqyzA0uUvuAmxIGY4sPd+Om
 dEtemXUaFIJ4eWVxTyxKtdk+iY3TYV5opMLY8VToXMxW/ssaM22qWiVXzy57rCR7SCI2
 8FcK6+yGv8maiafPs+0lOYrKqEQNlj2IlWjyRjZtlFaTLeGoMh5JWUts5V85qoxMs4RR
 XFq/KZvHv3KuC+K8isOakEgbVixQhXJeKo1EJM+wFrCNed/FWxdNwIDWf6rOsZE07UUM
 uSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qhl6Zl2Xiee6O0lgUUMvOSsCyF3jSpeG9tyWvTBlYXs=;
 b=ZBITApvNVzsOWhGbbfOcJQ0YKQToE24LhFkQ5YiQGk9YBrpgGvjhLq3Demlxy648to
 5NyELUefnZQ+z/AOyGPmqLlO4iOH4H11rofZpGJLgIjVzMyKZHG3Ekq0NDeOku7LtNsZ
 YkBG770wBIdFrNAiQNuP6dx+BeSCtwN5PUrCKqibMt7IMrKSxAoN3a7tkFND7EFt6d3w
 BYDsbPxJX/05tDy4SdGpDPr7Hd0ObrZk7mGFqdYAqaW8O/elW8Xjxz54Z+jjcpArPcvH
 06p8O3U2Csecd9hF318XJ55P6t7tskR+1wrPyXMdigEFoU7HxlmDAUCADKZF3e4BKhHd
 WNJw==
X-Gm-Message-State: AKaTC02BLbwXSFs2J2iTPOWCGSryvG5WRFxZtLAvQCDO15J51Ob3bwC3KXjNew5P44ugBo4T36LvCpLq2ahjUyfc
X-Received: by 10.31.149.138 with SMTP id x132mr223745vkd.86.1479344807910;
 Wed, 16 Nov 2016 17:06:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.83.151 with HTTP; Wed, 16 Nov 2016 17:06:27 -0800 (PST)
In-Reply-To: <20161115113954.GK15757@heinlein.lan>
References: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
 <20161115113954.GK15757@heinlein.lan>
From: Abhishek Pandit <abhishekpandit@google.com>
Date: Wed, 16 Nov 2016 17:06:27 -0800
Message-ID: <CAN61AdfuRqu=fB1UnOhHBti=xPErz3uETfh8jcPtyftxnbUMVQ@mail.gmail.com>
Subject: Re: Refactoring skeleton flash control
To: Patrick Williams <patrick@stwcx.xyz>, Cyril Bur <cyrilbur@gmail.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Rick Altherr <raltherr@google.com>
Cc: anoo@linux.vnet.ibm.com, openbmc@lists.ozlabs.org, 
 Nancy Yuen <yuenn@google.com>
Content-Type: multipart/alternative; boundary=001a1141003ac6f972054174cdd0
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
X-List-Received-Date: Thu, 17 Nov 2016 01:06:52 -0000

--001a1141003ac6f972054174cdd0
Content-Type: text/plain; charset=UTF-8

Consolidating my responses to Joel + Patrick.

Joel:

> I imagine you mean the tmpfs (which is backed by SDRAM).


Yes

Have you had input from security/cryptography people for what to do here?


Not yet. I'm preparing the phosphor-flash-control repository (locally) with
a more detailed design README. I'm going to review this internally with a
few people and send out a proposal.
----

Patrick

We have used OpenSSL interfaces for other projects.  I'm not stuck on
> that though.


I just used PGP as an example due to familiarity. Will have more details
once I actually get some security reviews.

---

Re: Software level management

Important use cases (from REST perspective):
>     - How does a user identify which levels are installed?  Which levels
>       are activated?  Which levels are kept for optional downgrade?
>       Which levels are stored on redundant media (ex. dual side flash).
>     - How does a user upload new levels?
>     - How does a user request a level to be activated?


Our traditional approach is host managed. +raltherr might have some more
thoughts on this for more bmc-centric software management.

I think the flash interface will need to be updated to be able to identify
exactly what software on the flash (i.e. Active). I don't know if a single
version for the entire flash (i.e. bmc_v0.1.0) is appropriate or a version
for each individual piece of the bmc image (i.e. uboot_v1.1.0,
kernel_v4.7.11, rofs_v1.2.3). Providing this would probably require some
compile time specialization on the host flash for different architectures.

For the other states (persisted, available, backup, etc), those just seem
like policies and the actual flash interface shouldn't really care about it
(unless the intent is to write the "backup" image to the flash itself).


On Tue, Nov 15, 2016 at 3:39 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> Abhishek,
>
> On Mon, Nov 14, 2016 at 11:09:30AM -0800, Abhishek Pandit wrote:
> > Hey Adriana,
> >
> > I've started with how I think the dbus interface should behave:
> > https://gerrit.openbmc-project.xyz/#/c/1166/.
>
> I would like to see some better modeling in place for management of code
> levels.  There may be some overlap with what you are proposing, but you
> do seem focused on flashing specifically.  Look this over and let me
> know what you think, how much overlap there is, and how much you want to
> tackle now.  We could do some things like temporarily define the
> interface in org.openbmc, to indicate eventual deprecation, but allow
> you to continue making progress on the function.
>
> -------------------------
>
> Important use cases (from REST perspective):
>     - How does a user identify which levels are installed?  Which levels
>       are activated?  Which levels are kept for optional downgrade?
>       Which levels are stored on redundant media (ex. dual side flash).
>     - How does a user upload new levels?
>     - How does a user request a level to be activated?
>
> Interface modeling:
>     interface xyz.openbmc_project.Software.Level:
>         property - string Name
>                  - string Version
>                  - enum Persistence { "Temporary", "Persisted" }
>                  - enum State { "Loading", "Verified", "Failed",
> "Available" }
>     interface xyz.openbmc_project.FilePath:
>         < Attached to Software.Level object for images resident on the
>           BMC and not in flash modules only. Ex. tmpfs >
>         property - string Path
>
>     interface xyz.openbmc_project.Object.Association:
>         < Associate Software.Level <-> Inventory.Item >
>     interface xyz.openbmc_project.Software.Activation:
>         < Attached to Object.Assocation object >
>         property - enum Activation { "Ready", "Activating", "Backup",
>                                      "Active"
>                    enum RequestedActivation { "None", "Backup",
>                                               "Active" }
>                    integer Progress
>
>     interface xyz.openbmc_project.Object.Add:
>         Used to 'put' new image via HTTPS.  Need to confirm with Brad.
>     interface xyz.openbmc_project.Object.Delete:
>         Used to 'delete' images (from filesystem).
>
> Object modeling:
>     /xyz/openbmc_project/software:
>         Owned by "DownloadManager" which supports Object.Add interface.
> This
>         can be called by REST when a user uploads a new level.  Later,
>         we could attach additional interfaces here, possibly owned by
>         other processes, such as 'Software.DownloadViaTFTP'.
>
>     /xyz/openbmc_project/software/<id>:
>         Owned by "DownloadManager" for images which are resident in
>         tmpfs and a local filesystem ("Available" images).  Owned by
>         "HostUpdater", "BMCUpdater", etc. for images which are resident
>         in flash modules ("Active", "Backup").
>
>     /xyz/openbmc_project/software/<id>/imageFor:
>         Owned by "...Updater" processes and supports the
>         Object.Association and Software.Activation interfaces.
>
> Use case solutions:
>     - How does a user identify which levels are installed?
>         Enumerate /xyz/openbmc_project/software/
>     - ... are activated?
>         List /xyz/openbmc_project/software/ , look at Activation state
>         on assocations.
>     - ... are kept for optional downgrade?
>         List /xyz/openbmc_project/software/ , see images "Persisted",
>         "Available" and not ("Active" or "Backup").
>     - How does a user upload new levels?
>         Do a HTTP PUT to /xyz/openbmc_project/software/<id>.
>     - How does a user request a level to be activated?
>         Set RequestedActivation to "Active", "...Updater" process will
>         begin activation.
> >
> > The overall plan for the flash interface in my head:
> >
> >    - REST (or some other) interface receives image + signature to update
> >    flash
> >       - Gets saved to filesystem and flash control is called
> >    - Flash control loads the files into memory and verifies the signature
> >       - Reference implementation would probably just be pgp
>
> We have used OpenSSL interfaces for other projects.  I'm not stuck on
> that though.
>
> >    - Flash control locks the flash device
> >       - This needs some more thought and probably new dbus interfaces;
> >       important for host flash
>
> Yeah, could certainly be a new interface for this on the same object as
> Software.Activation.
>
> >    - Image written to flash
> >    - Lock on flash device released
> >    - Signal asserted (Done)
>
> Handled by org.freedesktop.Object.PropertyChanged signal on
> "Activation" in my modeling above.
>
> -----------------
>
> This is just what I had floating around in the back of my head of what
> we would [eventually] do for code update.  I have some past experience with
> CIM and I believe this conceptually lines up with what CIM and Redfish have
> both done.  I'm certainly not fixed on any particular interface, property,
> or enumeration names.
>
> --
> Patrick Williams
>

--001a1141003ac6f972054174cdd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Consolidating my responses to Joel + Patrick.</div><d=
iv><br></div><div>Joel:</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><span style=3D"color:rgb(0,0,0);font-size:12.8px">I imagine you mean th=
e tmpfs (which is backed by SDRAM).</span></blockquote><div><br></div><div>=
Yes</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
span style=3D"color:rgb(0,0,0);font-size:12.8px">Have you had input from se=
curity/cryptography people for what to do here?</span></blockquote><div><sp=
an style=3D"color:rgb(0,0,0);font-size:12.8px"><br></span></div><div><font =
color=3D"#000000"><span style=3D"font-size:12.8px">Not yet. I&#39;m prepari=
ng the phosphor-flash-control repository (locally) with a more detailed des=
ign README. I&#39;m going to review this internally with a few people and s=
end out a proposal.</span></font></div><div><font color=3D"#000000"><span s=
tyle=3D"font-size:12.8px">----</span></font></div><div><font color=3D"#0000=
00"><span style=3D"font-size:12.8px"><br></span></font></div><div><font col=
or=3D"#000000"><span style=3D"font-size:12.8px">Patrick</span></font></div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span styl=
e=3D"color:rgb(0,0,0);font-size:12.8px">We have used OpenSSL interfaces for=
 other projects.=C2=A0 I&#39;m not stuck on<br></span><span style=3D"color:=
rgb(0,0,0);font-size:12.8px">that though.</span></blockquote><div><br></div=
><div>I just used PGP as an example due to familiarity. Will have more deta=
ils once I actually get some security reviews.</div><div><br></div><div>---=
</div><div><br></div><div>Re: Software level management</div><div><br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><span style=3D"color:rgb=
(0,0,0);font-size:12.8px">Important use cases (from REST perspective):<br><=
/span><span style=3D"color:rgb(0,0,0);font-size:12.8px">=C2=A0 =C2=A0 - How=
 does a user identify which levels are installed?=C2=A0 Which levels<br></s=
pan><span style=3D"color:rgb(0,0,0);font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 =
are activated?=C2=A0 Which levels are kept for optional downgrade?<br></spa=
n><span style=3D"color:rgb(0,0,0);font-size:12.8px">=C2=A0 =C2=A0 =C2=A0 Wh=
ich levels are stored on redundant media (ex. dual side flash).<br></span><=
span style=3D"color:rgb(0,0,0);font-size:12.8px">=C2=A0 =C2=A0 - How does a=
 user upload new levels?<br></span><span style=3D"color:rgb(0,0,0);font-siz=
e:12.8px">=C2=A0 =C2=A0 - How does a user request a level to be activated?<=
/span></blockquote><div><br></div><div>Our traditional approach is host man=
aged. +raltherr might have some more thoughts on this for more bmc-centric =
software management.</div><div><br></div><div>I think the flash interface w=
ill need to be updated to be able to identify exactly what software on the =
flash (i.e. Active). I don&#39;t know if a single version for the entire fl=
ash (i.e. bmc_v0.1.0) is appropriate or a version for each individual piece=
 of the bmc image (i.e. uboot_v1.1.0, kernel_v4.7.11, rofs_v1.2.3). Providi=
ng this would probably require some compile time specialization on the host=
 flash for different architectures.</div><div><br></div><div>For the other =
states (persisted, available, backup, etc), those just seem like policies a=
nd the actual flash interface shouldn&#39;t really care about it (unless th=
e intent is to write the &quot;backup&quot; image to the flash itself).</di=
v><div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Tue, Nov 15, 2016 at 3:39 AM, Patrick Williams <span dir=3D"ltr">&=
lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_blank">patrick@stwcx.xyz=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Abhishek,<br>
<br>
On Mon, Nov 14, 2016 at 11:09:30AM -0800, Abhishek Pandit wrote:<br>
&gt; Hey Adriana,<br>
<span class=3D"">&gt;<br>
&gt; I&#39;ve started with how I think the dbus interface should behave:<br=
>
&gt; <a href=3D"https://gerrit.openbmc-project.xyz/#/c/1166/" rel=3D"norefe=
rrer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/1166/</=
a>.<br>
<br>
</span>I would like to see some better modeling in place for management of =
code<br>
levels.=C2=A0 There may be some overlap with what you are proposing, but yo=
u<br>
do seem focused on flashing specifically.=C2=A0 Look this over and let me<b=
r>
know what you think, how much overlap there is, and how much you want to<br=
>
tackle now.=C2=A0 We could do some things like temporarily define the<br>
interface in org.openbmc, to indicate eventual deprecation, but allow<br>
you to continue making progress on the function.<br>
<br>
-------------------------<br>
<br>
Important use cases (from REST perspective):<br>
=C2=A0 =C2=A0 - How does a user identify which levels are installed?=C2=A0 =
Which levels<br>
=C2=A0 =C2=A0 =C2=A0 are activated?=C2=A0 Which levels are kept for optiona=
l downgrade?<br>
=C2=A0 =C2=A0 =C2=A0 Which levels are stored on redundant media (ex. dual s=
ide flash).<br>
=C2=A0 =C2=A0 - How does a user upload new levels?<br>
=C2=A0 =C2=A0 - How does a user request a level to be activated?<br>
<br>
Interface modeling:<br>
=C2=A0 =C2=A0 interface xyz.openbmc_project.Software.<wbr>Level:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 property - string Name<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- string Vers=
ion<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- enum Persis=
tence { &quot;Temporary&quot;, &quot;Persisted&quot; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0- enum State =
{ &quot;Loading&quot;, &quot;Verified&quot;, &quot;Failed&quot;, &quot;Avai=
lable&quot; }<br>
=C2=A0 =C2=A0 interface xyz.openbmc_project.FilePath:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; Attached to Software.Level object for imag=
es resident on the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BMC and not in flash modules only. Ex. t=
mpfs &gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 property - string Path<br>
<br>
=C2=A0 =C2=A0 interface xyz.openbmc_project.Object.<wbr>Association:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; Associate Software.Level &lt;-&gt; Invento=
ry.Item &gt;<br>
=C2=A0 =C2=A0 interface xyz.openbmc_project.Software.<wbr>Activation:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt; Attached to Object.Assocation object &gt;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 property - enum Activation { &quot;Ready&quot;,=
 &quot;Activating&quot;, &quot;Backup&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Active&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum R=
equestedActivation { &quot;None&quot;, &quot;Backup&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;Active&quot; }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intege=
r Progress<br>
<br>
=C2=A0 =C2=A0 interface xyz.openbmc_project.Object.<wbr>Add:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Used to &#39;put&#39; new image via HTTPS.=C2=
=A0 Need to confirm with Brad.<br>
=C2=A0 =C2=A0 interface xyz.openbmc_project.Object.<wbr>Delete:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Used to &#39;delete&#39; images (from filesyste=
m).<br>
<br>
Object modeling:<br>
=C2=A0 =C2=A0 /xyz/openbmc_project/software:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Owned by &quot;DownloadManager&quot; which supp=
orts Object.Add interface.=C2=A0 This<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 can be called by REST when a user uploads a new=
 level.=C2=A0 Later,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 we could attach additional interfaces here, pos=
sibly owned by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 other processes, such as &#39;Software.Download=
ViaTFTP&#39;.<br>
<br>
=C2=A0 =C2=A0 /xyz/openbmc_project/software/<wbr>&lt;id&gt;:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Owned by &quot;DownloadManager&quot; for images=
 which are resident in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tmpfs and a local filesystem (&quot;Available&q=
uot; images).=C2=A0 Owned by<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;HostUpdater&quot;, &quot;BMCUpdater&quot;=
, etc. for images which are resident<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 in flash modules (&quot;Active&quot;, &quot;Bac=
kup&quot;).<br>
<br>
=C2=A0 =C2=A0 /xyz/openbmc_project/software/<wbr>&lt;id&gt;/imageFor:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Owned by &quot;...Updater&quot; processes and s=
upports the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Object.Association and Software.Activation inte=
rfaces.<br>
<br>
Use case solutions:<br>
=C2=A0 =C2=A0 - How does a user identify which levels are installed?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Enumerate /xyz/openbmc_project/software/<br>
=C2=A0 =C2=A0 - ... are activated?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 List /xyz/openbmc_project/software/ , look at A=
ctivation state<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 on assocations.<br>
=C2=A0 =C2=A0 - ... are kept for optional downgrade?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 List /xyz/openbmc_project/software/ , see image=
s &quot;Persisted&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Available&quot; and not (&quot;Active&quo=
t; or &quot;Backup&quot;).<br>
=C2=A0 =C2=A0 - How does a user upload new levels?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Do a HTTP PUT to /xyz/openbmc_project/software/=
<wbr>&lt;id&gt;.<br>
=C2=A0 =C2=A0 - How does a user request a level to be activated?<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Set RequestedActivation to &quot;Active&quot;, =
&quot;...Updater&quot; process will<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 begin activation.<br>
<span class=3D"">&gt;<br>
&gt; The overall plan for the flash interface in my head:<br>
&gt;<br>
</span>&gt;=C2=A0 =C2=A0 - REST (or some other) interface receives image + =
signature to update<br>
&gt;=C2=A0 =C2=A0 flash<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Gets saved to filesystem and flash control=
 is called<br>
&gt;=C2=A0 =C2=A0 - Flash control loads the files into memory and verifies =
the signature<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- Reference implementation would probably ju=
st be pgp<br>
<br>
We have used OpenSSL interfaces for other projects.=C2=A0 I&#39;m not stuck=
 on<br>
that though.<br>
<br>
&gt;=C2=A0 =C2=A0 - Flash control locks the flash device<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- This needs some more thought and probably =
new dbus interfaces;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0important for host flash<br>
<br>
Yeah, could certainly be a new interface for this on the same object as<br>
Software.Activation.<br>
<br>
&gt;=C2=A0 =C2=A0 - Image written to flash<br>
&gt;=C2=A0 =C2=A0 - Lock on flash device released<br>
&gt;=C2=A0 =C2=A0 - Signal asserted (Done)<br>
<br>
Handled by org.freedesktop.Object.<wbr>PropertyChanged signal on<br>
&quot;Activation&quot; in my modeling above.<br>
<br>
-----------------<br>
<br>
This is just what I had floating around in the back of my head of what<br>
we would [eventually] do for code update.=C2=A0 I have some past experience=
 with<br>
CIM and I believe this conceptually lines up with what CIM and Redfish have=
<br>
both done.=C2=A0 I&#39;m certainly not fixed on any particular interface, p=
roperty,<br>
or enumeration names.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--001a1141003ac6f972054174cdd0--
