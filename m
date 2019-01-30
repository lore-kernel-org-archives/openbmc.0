Return-Path: <derick.montague@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Cyor6FYG"; 
 dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q7zQ0Q9YzDqQr
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 14:25:21 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id v13so24380951wrw.5
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 19:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VzXsuOUXczrVnTaTrQfAtg0BMO46Vc9qDrJFPLasgAM=;
 b=Cyor6FYGmyaDMPHCgtsu6+9KGhKvCGRcyGtdubdlPzDuXAhcH8wp1deij7PrwvBW4I
 aLIE2TXHDLIcxsCEYx+uLdmBtGvH27UeSphr2pVFDdaLmtMQYW6AZI1SW5SEXOf/achh
 QoXVJbuIJHllBoMpDugR9AYEnszmzSi514HxH6ePOK+DjqL+BnOhHas3grEfvGTmHxvw
 3YfyotYMgPdbfavEGGG0YKjaZyS1sdSzzDtmJiu3KzJBqNDrAj3asKDghARG23VGDjE1
 acs9RdZIiiOWdb45RAgHUCs/q8NlT3bkBTcUUeOc14gRYxEbdX6IIJw1kmnC+LfoVr3O
 ZfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VzXsuOUXczrVnTaTrQfAtg0BMO46Vc9qDrJFPLasgAM=;
 b=T8pDqpIPItBNyIa8f+OgBwm9LmwWS+KerJahVtWGB0WygYI5NrrAcXKUE4KYzpc+IS
 2zsOtVRMl90otTk9QOV8Ba4cB/DhnCQGGLVvspiBrz/0hBPvlBEksP+Vqs/l2KbNZ7fD
 +cm/PkqThRCqVGB8sf5asIy4oHGqQVLUKN9j5gv1NVY6HuJnUYz/BkiopQWMvYX1Q7Go
 a6lmYRyXaH6C4gKlZ8YDEVBlbI5oEuK4Uz7Z/gGcu8EML+ZTzcdRK4lpkZFj45uWkovX
 XC5vH0odapZuXVoCU1BpMXgAldRdfQM4DoNYy7BX0APlBWxSq0eMbOuVFAHwhlzoaErh
 bqNw==
X-Gm-Message-State: AJcUukcUR7MTyFuwrssdWYhCrHM7cSd7hluHSiXjXZqoirhfTt7oXqfd
 CQfCH4/xG1g/snbZgSfxWF/nRcPvW6Ggq1W72vNeyhl/
X-Google-Smtp-Source: ALg8bN4IEcvhUxMA9cCuBdK794Xri9GFP0+mnWioqJFBWMpKCvTI8i1EXjk8zP6gqLz6WPZsCPkERhwb6xkuaPBGfPA=
X-Received: by 2002:a5d:5351:: with SMTP id t17mr28108006wrv.288.1548818718860; 
 Tue, 29 Jan 2019 19:25:18 -0800 (PST)
MIME-Version: 1.0
References: <CAOUmYFTGSMQy2-C6xphK1=-ecVAsb-0WSnB89rcBFBm15QPZcw@mail.gmail.com>
 <8ed86145-296c-72b6-2fd2-989629533d59@intel.com>
In-Reply-To: <8ed86145-296c-72b6-2fd2-989629533d59@intel.com>
From: Derick <derick.montague@gmail.com>
Date: Tue, 29 Jan 2019 21:25:07 -0600
Message-ID: <CAOUmYFTfeWKsPvJLSnEbExVy6+XZ9nNdmK0y_Vvvw94g6Zty+Q@mail.gmail.com>
Subject: Re: WebUI Fonts
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008f2b950580a475cc"
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
X-List-Received-Date: Wed, 30 Jan 2019 03:25:23 -0000

--0000000000008f2b950580a475cc
Content-Type: text/plain; charset="UTF-8"

>
> The first hit I get what I search "webpack icomoon" is a link to a stack
> overflow with the title "webpack with icomoon does not work".  That's
> not a great sign, although I haven't dug into the details yet.
>

That looks like an icon font issue that we wouldn't have to deal with
if we went the SVG sprite route.


> Webpack also has some built-in capabilities for SVG sprites that I
> haven't had time to look at.  It sounds like that is the current
> best-practice for webpack.
> https://github.com/kisenka/svg-sprite-loader
>
> If we're looking at dropping webpack, or doing a two stage build
> (icomoon then webpack) that's something that needs a longer discussion.
> Alternatively webpack is open source, we could certainly just go fix
> icomoon support.
>

This looks really good. All we need to do is add
the SVGs to a directory and import in order to use it. The
process is much simpler than the icomoon approach and downstream
it's as simple as replacing the SVG to use a different icon.

Say more on this point......  I'm not sure I understand.  Wont people
> always have to override some file to update icons?
>

The svg-sprite-loader handles this well. If someone wants to use a
different Twitter icon, they just replace it downstream. No actual markup
would need to change, which is what I meant when I said no coding
would be needed.

The icomoon approaceh downstream would use a different SVG sprite, but
building and generating with iconmoon is cumbersome compared
to having webpack do the work for us!

My preference would be to use the built-in webpack sprite loader, under
> the assumption that it works better, and will be easier to maintain long
> term, but I'm happy to support icomoon if it's a better tool.
>

Looking at the loader, I think this is the right direction. If we don't
encounter any unforeseen issues
this seems like the simplest approach.

On Tue, Jan 29, 2019 at 4:46 PM Ed Tanous <ed.tanous@intel.com> wrote:

>
> On 1/29/19 2:21 PM, Derick wrote:
> >
> >
> > I have an accessibility audit of our icons on a todo list and I'd love
> > to create the documentation to help make the
> > application more inclusive! I just need to prioritize the time with
> > another project.
> I didn't mean to call you out.  I realize we're all busy :)
>
> >
> > small. We can test that, but the SVG icons have been typically smaller
> > than font icons.
> That sounds like a great reason to use SVG over fonts.  If we can show
> that in a meaningful way, I'm happy to support moving the UI over to SVG.
>
> >
> >
> > The SVG sprite example above is exactly what I'm referring to. And the
> > icomoon tool (I refer to
> > that below in point #2 I have been using provides all the code,
> > including the SVG sprite.
> The first hit I get what I search "webpack icomoon" is a link to a stack
> overflow with the title "webpack with icomoon does not work".  That's
> not a great sign, although I haven't dug into the details yet.
>
> Webpack also has some built-in capabilities for SVG sprites that I
> haven't had time to look at.  It sounds like that is the current
> best-practice for webpack.
> https://github.com/kisenka/svg-sprite-loader
>
> If we're looking at dropping webpack, or doing a two stage build
> (icomoon then webpack) that's something that needs a longer discussion.
> Alternatively webpack is open source, we could certainly just go fix
> icomoon support.
>
> >
> >
> > I like the idea of using an SVG sprite. Using the <use> element (which
> > would required a small polyfill for IE 11)
> > the implementation is as simple as using font icons. We would only have
> > the icons we needed to use and the file size
> > (which we can test and evaluate) would be small since we don't need to
> > include the entire font-awesome library.
> >
> > Some reasons I prefer the SVG sprite is:
> > 1. It would allow for easy conversion downstream for anyone that wants
> > to use a different icon set
> > 2. Implementation is consistent and can be easily documented
>
> This is exactly the kind of background I was looking for on why this
> change is worth it, as well as trade offs and things that are required.
>
> >
> > We can keep the login icons inlined to minimize the load if we think
> > loading the SVG sprite is too much of a load.
>
> I think a single SVG sprite doesn't add too much load.  It's when we're
> pulling 12 different icons separately that we need to pay attention.
> Today, rendering the initial login page load requires 4 files, one of
> which is already an SVG (the openbmc logo), and 276KB of payload.   If
> we go to svg sprites, presumably the SVG file just gets bigger, but
> we're still requesting the same number of resources.  We should be in
> good shape.
>
> >
> >
> > Using an SVG sprite would make it easy to simply update the downstream
> > SVG sprite without
> > having to update any code.
> >
>
> Say more on this point......  I'm not sure I understand.  Wont people
> always have to override some file to update icons?
> >
> >
> > I agree with the use of a consistent and open icon set, like font
> > awesome. I have been using
> > a great tool called icomoon (free), https://icomoon.io/ to manage my
> > icon sets. It's fantastic
> > because we can use font awesome and can import icons if needed. The icon
> > set can be
> > saved as a JSON file and even added to the repository if needed, so that
> > anyone could
> > import it to icomoon and add or update icons using font awesome or any
> > number of other
> > free icon sets and then have an updated SVG sprite generated, as well as
> > downloading
> > the updated icon set config.
>
>
> My preference would be to use the built-in webpack sprite loader, under
> the assumption that it works better, and will be easier to maintain long
> term, but I'm happy to support icomoon if it's a better tool.
>
>
>
>
> Moving the webui to SVG sprites sounds like a positive thing to do, and
> has my support.  Looking forward to seeing the patchsets.
>
> -Ed
>
>

--0000000000008f2b950580a475cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">The first hit I get what I search &quot;webpack icomoon&quot; is=
 a link to a stack<br>overflow with the title &quot;webpack with icomoon do=
es not work&quot;.=C2=A0 That&#39;s<br>not a great sign, although I haven&#=
39;t dug into the details yet.<br></blockquote><div><br></div><div>That loo=
ks like an icon font issue that we wouldn&#39;t have to deal with</div><div=
>if we went the SVG sprite route.=C2=A0=C2=A0</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Webpack also has some built-in c=
apabilities for SVG sprites that I<br>haven&#39;t had time to look at.=C2=
=A0 It sounds like that is the current<br>best-practice for webpack.<br><a =
href=3D"https://github.com/kisenka/svg-sprite-loader" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/kisenka/svg-sprite-loader</a><br><br>If =
we&#39;re looking at dropping webpack, or doing a two stage build<br>(icomo=
on then webpack) that&#39;s something that needs a longer discussion.<br>Al=
ternatively webpack is open source, we could certainly just go fix<br>icomo=
on support.<br clear=3D"all"></blockquote><div><br></div><div>This looks re=
ally good. All we need to do is add</div><div>the SVGs to a directory and i=
mport in order to use it. The</div><div>process is much simpler than the ic=
omoon approach and downstream</div><div>it&#39;s as simple as replacing the=
 SVG to use a different icon.=C2=A0</div><div><div dir=3D"ltr" class=3D"gma=
il_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div></div></div></div></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Say more on this point......=C2=A0 I&#39=
;m not sure I understand.=C2=A0 Wont people<br>always have to override some=
 file to update icons?<br></blockquote><div><br></div><div>The svg-sprite-l=
oader handles this well. If someone wants to use a</div><div>different Twit=
ter icon, they just replace it downstream. No actual markup</div><div>would=
 need to change, which is what I meant when I said no coding</div><div>woul=
d be needed.=C2=A0</div><div><br></div><div>The icomoon approaceh downstrea=
m would use a different SVG sprite, but=C2=A0</div><div>building and genera=
ting with iconmoon is cumbersome compared</div><div>to having webpack do th=
e work for us!=C2=A0</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">My preference would be to use the built-in webpack sprite l=
oader, under<br>the assumption that it works better, and will be easier to =
maintain long<br>term, but I&#39;m happy to support icomoon if it&#39;s a b=
etter tool.<br></blockquote><div><br></div><div>Looking at the loader, I th=
ink this is the right direction. If we don&#39;t encounter any unforeseen i=
ssues</div><div>this seems like the simplest approach.=C2=A0=C2=A0</div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Jan 29, 2019 at 4:46 PM Ed Tanous &lt;<a href=3D"mailto:ed.tanous@inte=
l.com">ed.tanous@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><br>
On 1/29/19 2:21 PM, Derick wrote:<br>
&gt; <br>
&gt; <br>
&gt; I have an accessibility audit of our icons on a todo list and I&#39;d =
love<br>
&gt; to create the documentation to help make the=C2=A0<br>
&gt; application more inclusive! I just need to prioritize the time with<br=
>
&gt; another project.<br>
I didn&#39;t mean to call you out.=C2=A0 I realize we&#39;re all busy :)<br=
>
<br>
&gt; <br>
&gt; small. We can test that, but the SVG icons have been typically smaller=
<br>
&gt; than font icons. <br>
That sounds like a great reason to use SVG over fonts.=C2=A0 If we can show=
<br>
that in a meaningful way, I&#39;m happy to support moving the UI over to SV=
G.<br>
<br>
&gt; <br>
&gt; <br>
&gt; The SVG sprite example above is exactly what I&#39;m referring to. And=
 the<br>
&gt; icomoon tool (I refer to=C2=A0<br>
&gt; that below in point #2 I have been using provides all the code,<br>
&gt; including the SVG sprite.=C2=A0 <br>
The first hit I get what I search &quot;webpack icomoon&quot; is a link to =
a stack<br>
overflow with the title &quot;webpack with icomoon does not work&quot;.=C2=
=A0 That&#39;s<br>
not a great sign, although I haven&#39;t dug into the details yet.<br>
<br>
Webpack also has some built-in capabilities for SVG sprites that I<br>
haven&#39;t had time to look at.=C2=A0 It sounds like that is the current<b=
r>
best-practice for webpack.<br>
<a href=3D"https://github.com/kisenka/svg-sprite-loader" rel=3D"noreferrer"=
 target=3D"_blank">https://github.com/kisenka/svg-sprite-loader</a><br>
<br>
If we&#39;re looking at dropping webpack, or doing a two stage build<br>
(icomoon then webpack) that&#39;s something that needs a longer discussion.=
<br>
Alternatively webpack is open source, we could certainly just go fix<br>
icomoon support.<br>
<br>
&gt; <br>
&gt; <br>
&gt; I like the idea of using an SVG sprite. Using the &lt;use&gt; element =
(which<br>
&gt; would required a small polyfill for IE 11)=C2=A0<br>
&gt; the implementation is as simple as using font icons. We would only hav=
e<br>
&gt; the icons we needed to use and the file size=C2=A0<br>
&gt; (which we can test and evaluate) would be small since we don&#39;t nee=
d to<br>
&gt; include the entire font-awesome library.<br>
&gt; <br>
&gt; Some reasons I prefer the SVG sprite is:<br>
&gt; 1. It would allow for easy conversion downstream for anyone that wants=
<br>
&gt; to use a different icon set<br>
&gt; 2. Implementation is consistent and can be easily documented<br>
<br>
This is exactly the kind of background I was looking for on why this<br>
change is worth it, as well as trade offs and things that are required.<br>
<br>
&gt; <br>
&gt; We can keep the login icons inlined to minimize the load if we think<b=
r>
&gt; loading the SVG sprite is too much of a load.<br>
<br>
I think a single SVG sprite doesn&#39;t add too much load.=C2=A0 It&#39;s w=
hen we&#39;re<br>
pulling 12 different icons separately that we need to pay attention.<br>
Today, rendering the initial login page load requires 4 files, one of<br>
which is already an SVG (the openbmc logo), and 276KB of payload.=C2=A0 =C2=
=A0If<br>
we go to svg sprites, presumably the SVG file just gets bigger, but<br>
we&#39;re still requesting the same number of resources.=C2=A0 We should be=
 in<br>
good shape.<br>
<br>
&gt; <br>
&gt; <br>
&gt; Using an SVG sprite would make it easy to simply update the downstream=
<br>
&gt; SVG sprite without<br>
&gt; having to update any code.<br>
&gt; =C2=A0<br>
<br>
Say more on this point......=C2=A0 I&#39;m not sure I understand.=C2=A0 Won=
t people<br>
always have to override some file to update icons?<br>
&gt; <br>
&gt; =C2=A0<br>
&gt; I agree with the use of a consistent and open icon set, like font<br>
&gt; awesome. I have been using<br>
&gt; a great tool called icomoon (free),=C2=A0<a href=3D"https://icomoon.io=
/" rel=3D"noreferrer" target=3D"_blank">https://icomoon.io/</a> to manage m=
y<br>
&gt; icon sets. It&#39;s fantastic<br>
&gt; because we can use font awesome and can import icons if needed. The ic=
on<br>
&gt; set can be=C2=A0<br>
&gt; saved as a JSON file and even added to the repository if needed, so th=
at<br>
&gt; anyone could<br>
&gt; import it to icomoon and add or update icons using font awesome or any=
<br>
&gt; number of other<br>
&gt; free icon sets and then have an updated SVG sprite generated, as well =
as<br>
&gt; downloading<br>
&gt; the updated icon set config. <br>
<br>
<br>
My preference would be to use the built-in webpack sprite loader, under<br>
the assumption that it works better, and will be easier to maintain long<br=
>
term, but I&#39;m happy to support icomoon if it&#39;s a better tool.<br>
<br>
<br>
<br>
<br>
Moving the webui to SVG sprites sounds like a positive thing to do, and<br>
has my support.=C2=A0 Looking forward to seeing the patchsets.<br>
<br>
-Ed<br>
<br>
</blockquote></div></div>

--0000000000008f2b950580a475cc--
