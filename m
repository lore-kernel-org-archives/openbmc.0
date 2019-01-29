Return-Path: <derick.montague@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=derick.montague@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sDw7j9Q6"; 
 dkim-atps=neutral
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43q1Fj6wgVzDqP6
 for <openbmc@lists.ozlabs.org>; Wed, 30 Jan 2019 09:22:14 +1100 (AEDT)
Received: by mail-wm1-x333.google.com with SMTP id f188so19449688wmf.5
 for <openbmc@lists.ozlabs.org>; Tue, 29 Jan 2019 14:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/QCOEMoqBjiEM5nEHIdiDyZ3wYPoVQz5+PD49082RbI=;
 b=sDw7j9Q6StCbVaExF2XRLIH35tgw7T3MTO0Xxijws/53Oi5IFdwML2XynlkiTrJfi2
 pT0y8pDOrWAwdwt0zF0nvSyDVjsl4+JYqLhFVBCJZInLe7+AuICn2t8y5zlswcCTec2r
 pei8yFJWKwE8tV2gC9aMXR9gjU0gKnXuWqaWw9Il4ZOIF4VnFl29ZFY8mNKnH4XV21+q
 w1H1o5iDTLAd9XKkG7aWTbiDFcbvIpEpD1is5Y7kNGKCJXw5dPC3PcpyPKfiT20EV5y5
 /UB2PsbNXFrE2EkH7pM//aCf/0MLwy8F/rH7rzyFFdAJNyIWZRdimXsQg0xuna42N3R7
 zcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/QCOEMoqBjiEM5nEHIdiDyZ3wYPoVQz5+PD49082RbI=;
 b=g5cPrSdAHB5Mcw3SdsiNZ0LBEfMWXLTaLLXhWKoGDGlOXJ55dzR6kb4uEE2PaCfmZY
 zlhqBnEhNSQerPH8/lPqEq5MlI5uEOqetZj+zpb0aZAXEz9pYZN5rD07X5ajZ6G462MG
 jXG4L0vxfX5gSj8auNs6Wkxfs32cFtIlgauqmCBB22HGXjz/UGmZwTmxwU+3++7fj/92
 esws/U2pgtXlI44cKkK3ZEfs3NfXbyqSfYBVGmc83byEQbSeftW9Qx1Iy7137GjOZV80
 FSSPb9q6npozkbvrD+GplCzl/UWXAzVoyoc/mnY5Rglzi75667m13cL+jLf75+BAP7dk
 GVOw==
X-Gm-Message-State: AJcUukfweAxgVk7tAfcJjqrEUvqJbOVbExsqL2uX3tIYB9IxhXZEWMnD
 q5NOgDYGv4ryzK5grpuSP5lNOZJD3KpZ1hrAvD506A==
X-Google-Smtp-Source: ALg8bN4gtWMEgZshmVrRr/T10/83qLSdiAIzSG1vZjxIndEEZWX4oA74u+LFdcMDKLnDaIHx1R1WOvET1kHwJ7Uknrk=
X-Received: by 2002:a1c:be11:: with SMTP id o17mr22363626wmf.111.1548800530824; 
 Tue, 29 Jan 2019 14:22:10 -0800 (PST)
MIME-Version: 1.0
From: Derick <derick.montague@gmail.com>
Date: Tue, 29 Jan 2019 16:21:59 -0600
Message-ID: <CAOUmYFTGSMQy2-C6xphK1=-ecVAsb-0WSnB89rcBFBm15QPZcw@mail.gmail.com>
Subject: Re: WebUI Fonts
To: openbmc@lists.ozlabs.org
Content-Type: multipart/mixed; boundary="00000000000077f0860580a03988"
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
X-List-Received-Date: Tue, 29 Jan 2019 22:22:19 -0000

--00000000000077f0860580a03988
Content-Type: multipart/alternative; boundary="00000000000077f0830580a03983"

--00000000000077f0830580a03983
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> Let=E2=80=99s continue the discussion we had on the call with the list, a=
nd see
> if there=E2=80=99s anyone else interested in the topic.
>
> From my understanding, there are two issues here at play in the webui:
>
> 1. Should we be consistent about SVG icons versus font icons?  Which
> should we use?
> My take on this is that we should do whatever is easiest to maintain.
> Today we use both custom SVGs inline in the nav bar, as well as some
> font icons from the glyficons pack.  There were some concerns about
> accessibility on font icons that we should open a bug up on github and
> understand.  I would really like if that bug led to some documentation
> about how we handle accessibility, and what we would like to see from
> patchsets going forward in clear and concise rules, and a patchset to
> make the UI as it stands consistent in this regard.


I have an accessibility audit of our icons on a todo list and I'd love to
create the documentation to help make the
application more inclusive! I just need to prioritize the time with another
project.


>
> The solution I would like to see long term is to pull in a single font
> file, or single svg sprite file, and utilize webpacks built in tree
> shaking to keep it small.


With a single SVG sprite or definition file, tree shaking may not be
needed. Based on
the small number of icons we are using the file after compression should be
relatively
small. We can test that, but the SVG icons have been typically smaller than
font icons.


>
> With that said, my opinions between the two aren't that strong, as I
> believe functionally both options can achieve the same result.  Anyone
> that=E2=80=99s willing to push patches enabling one or another without br=
eaking
> something, or effecting our build stats would be appreciated by me.  I
> could certainly be convinced that inline SVG, using the webpack backend
> was the better option, but I would really like to see some numbers on
> checked-in code size, final rootfs size, or start-up performance
> (preferably all 3).
>
>
I think the SVG sprite of definition option would be simple to implement
and should not
require too much work to implement.


> An example of setting of webpack up for fontawesome font tree shaking:
> https://fontawesome.com/how-to-use/with-the-api/other/tree-shaking
>
> An example of using fontawesome with SVG sprites:
> https://fontawesome.com/how-to-use/on-the-web/advanced/svg-sprites


The SVG sprite example above is exactly what I'm referring to. And the
icomoon tool (I refer to
that below in point #2 I have been using provides all the code, including
the SVG sprite.


>
> I think the important thing we need to be clear on and document is why
> we're making the change we're making.  Today the webui uses inline svg
> for the navbar icons;  Because the way it's built, those are required at
> initial page load, and we don't want to hold up the initial page load
> while we incur another round trip time to query the BMC for all of the
> icons.  The glyficons are loaded after the user is logged in.  Doing
> this spreads out the BMC load in the most common case, and doesn't incur
> a large payload download for loading the login page.
>
> One thing to be careful of with inline SVG:  Some of the SVG keywords
> will trigger the browsers content security policy.  Because SVG icons
> are read in as XML, things like "style" keywords need to be removed,
> similar to this review.
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/16949
>
>
I like the idea of using an SVG sprite. Using the <use> element (which
would required a small polyfill for IE 11)
the implementation is as simple as using font icons. We would only have the
icons we needed to use and the file size
(which we can test and evaluate) would be small since we don't need to
include the entire font-awesome library.

Some reasons I prefer the SVG sprite is:
1. It would allow for easy conversion downstream for anyone that wants to
use a different icon set
2. Implementation is consistent and can be easily documented

We can keep the login icons inlined to minimize the load if we think
loading the SVG sprite is too much of a load.


2. Should we allow library icons?
> This one is important to me.  To highlight the importance, let me lay
> out a hypothetical scenario.
> Developer X wants to build a new page on the webui to allow the BMC to
> tweet system failures (side note, this would be an awesome way to
> implement a hosted logger in the cloud for free).  Said developer is not
> a visual designer, nor has the ability to build icons.  They pull in the
> various buttons, textboxes, and forms from throughout the webui to build
> their UI, following the style guide while they do it with the existing
> CSS.  For their navbar icon, they pull in the twitter icon here:
> https://fontawesome.com/icons/twitter?style=3Dbrands
> The icon is responsive, uses vector graphics, is properly sized, and
> adds a negligible size to the final rootfs.
>
> Do we reject their code because they didn't create their own icon?
>
> I would advocate the answer is no.  I'm having trouble getting a read on
> this, but it sounds like the answer that is being proposed is that we
> should start enforcing icon style before merge for "consistency", but
> I'm not really following the end goal.  If someone is wanting to remove
> pages because the icon doesn't have a consistent style, that is easy
> enough to do in a config in the per-machine/per-company repositories.


Using an SVG sprite would make it easy to simply update the downstream SVG
sprite without
having to update any code.


>
> If someone wants to make the style more consistent, they can certainly
> push new custom icons to do that.  I think master branch of the webui
> needs to point at a web page that enables as much functionality as we
> can.  Having to create custom icons is one more reason for people to
> fork the codebase and not contribute back, and we want to avoid that as
> much as possible.
>
> Said another way, I would much rather have a first class UI feature with
> a stock icon, than no feature at all.
>
>
I agree with the use of a consistent and open icon set, like font awesome.
I have been using
a great tool called icomoon (free), https://icomoon.io/ to manage my icon
sets. It's fantastic
because we can use font awesome and can import icons if needed. The icon
set can be
saved as a JSON file and even added to the repository if needed, so that
anyone could
import it to icomoon and add or update icons using font awesome or any
number of other
free icon sets and then have an updated SVG sprite generated, as well as
downloading
the updated icon set config.

Derick Montague
* * * * * * * * * * * * * * * *

> From: *Ed Tanous* <ed.tanous@intel.com>
> Date: Mon, Jan 28, 2019 at 1:13 PM
> Subject: WebUI Fonts
> To: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
>
>
> Let=E2=80=99s continue the discussion we had on the call with the list, a=
nd see
> if there=E2=80=99s anyone else interested in the topic.
>
> From my understanding, there are two issues here at play in the webui:
>
> 1. Should we be consistent about SVG icons versus font icons?  Which
> should we use?
> My take on this is that we should do whatever is easiest to maintain.
> Today we use both custom SVGs inline in the nav bar, as well as some
> font icons from the glyficons pack.  There were some concerns about
> accessibility on font icons that we should open a bug up on github and
> understand.  I would really like if that bug led to some documentation
> about how we handle accessibility, and what we would like to see from
> patchsets going forward in clear and concise rules, and a patchset to
> make the UI as it stands consistent in this regard.
> The solution I would like to see long term is to pull in a single font
> file, or single svg sprite file, and utilize webpacks built in tree
> shaking to keep it small.
>
> With that said, my opinions between the two aren't that strong, as I
> believe functionally both options can achieve the same result.  Anyone
> that=E2=80=99s willing to push patches enabling one or another without br=
eaking
> something, or effecting our build stats would be appreciated by me.  I
> could certainly be convinced that inline SVG, using the webpack backend
> was the better option, but I would really like to see some numbers on
> checked-in code size, final rootfs size, or start-up performance
> (preferably all 3).
>
> An example of setting of webpack up for fontawesome font tree shaking:
> https://fontawesome.com/how-to-use/with-the-api/other/tree-shaking
>
> An example of using fontawesome with SVG sprites:
> https://fontawesome.com/how-to-use/on-the-web/advanced/svg-sprites
>
> I think the important thing we need to be clear on and document is why
> we're making the change we're making.  Today the webui uses inline svg
> for the navbar icons;  Because the way it's built, those are required at
> initial page load, and we don't want to hold up the initial page load
> while we incur another round trip time to query the BMC for all of the
> icons.  The glyficons are loaded after the user is logged in.  Doing
> this spreads out the BMC load in the most common case, and doesn't incur
> a large payload download for loading the login page.
>
> One thing to be careful of with inline SVG:  Some of the SVG keywords
> will trigger the browsers content security policy.  Because SVG icons
> are read in as XML, things like "style" keywords need to be removed,
> similar to this review.
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/16949
>
> 2. Should we allow library icons?
> This one is important to me.  To highlight the importance, let me lay
> out a hypothetical scenario.
> Developer X wants to build a new page on the webui to allow the BMC to
> tweet system failures (side note, this would be an awesome way to
> implement a hosted logger in the cloud for free).  Said developer is not
> a visual designer, nor has the ability to build icons.  They pull in the
> various buttons, textboxes, and forms from throughout the webui to build
> their UI, following the style guide while they do it with the existing
> CSS.  For their navbar icon, they pull in the twitter icon here:
> https://fontawesome.com/icons/twitter?style=3Dbrands
> The icon is responsive, uses vector graphics, is properly sized, and
> adds a negligible size to the final rootfs.
>
> Do we reject their code because they didn't create their own icon?
>
> I would advocate the answer is no.  I'm having trouble getting a read on
> this, but it sounds like the answer that is being proposed is that we
> should start enforcing icon style before merge for "consistency", but
> I'm not really following the end goal.  If someone is wanting to remove
> pages because the icon doesn't have a consistent style, that is easy
> enough to do in a config in the per-machine/per-company repositories.
> If someone wants to make the style more consistent, they can certainly
> push new custom icons to do that.  I think master branch of the webui
> needs to point at a web page that enables as much functionality as we
> can.  Having to create custom icons is one more reason for people to
> fork the codebase and not contribute back, and we want to avoid that as
> much as possible.
>
> Said another way, I would much rather have a first class UI feature with
> a stock icon, than no feature at all.
>
> -Ed
>
>

--00000000000077f0830580a03983
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><blockquote style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex" class=3D"gmail_quote"><span style=3D"font-family:Verdana,Geneva,sans-se=
rif;font-size:14px">Let=E2=80=99s continue the discussion we had on the cal=
l with the list, and see</span><br style=3D"font-family:Verdana,Geneva,sans=
-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif=
;font-size:14px">if there=E2=80=99s anyone else interested in the topic.</s=
pan><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><br =
style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=
=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">From my understan=
ding, there are two issues here at play in the webui:</span><br style=3D"fo=
nt-family:Verdana,Geneva,sans-serif;font-size:14px"><br style=3D"font-famil=
y:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verd=
ana,Geneva,sans-serif;font-size:14px">1. Should we be consistent about SVG =
icons versus font icons?=C2=A0 Which</span><br style=3D"font-family:Verdana=
,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Genev=
a,sans-serif;font-size:14px">should we use?</span><br style=3D"font-family:=
Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdan=
a,Geneva,sans-serif;font-size:14px">My take on this is that we should do wh=
atever is easiest to maintain.</span><br style=3D"font-family:Verdana,Genev=
a,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans=
-serif;font-size:14px">Today we use both custom SVGs inline in the nav bar,=
 as well as some</span><br style=3D"font-family:Verdana,Geneva,sans-serif;f=
ont-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-si=
ze:14px">font icons from the glyficons pack.=C2=A0 There were some concerns=
 about</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">a=
ccessibility on font icons that we should open a bug up on github and</span=
><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span s=
tyle=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">understand.=
=C2=A0 I would really like if that bug led to some documentation</span><br =
style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=
=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">about how we hand=
le accessibility, and what we would like to see from</span><br style=3D"fon=
t-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-fami=
ly:Verdana,Geneva,sans-serif;font-size:14px">patchsets going forward in cle=
ar and concise rules, and a patchset to</span><br style=3D"font-family:Verd=
ana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Ge=
neva,sans-serif;font-size:14px">make the UI as it stands consistent in this=
 regard.</span></blockquote><div><br></div><div>I have an accessibility aud=
it of our icons on a todo list and I&#39;d love to create the documentation=
 to help make the=C2=A0</div><div>application more inclusive! I just need t=
o prioritize the time with another project.</div><div>=C2=A0</div><blockquo=
te style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex" class=3D"gmail_quote"><br style=3D"font-family:Verdana,G=
eneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,=
sans-serif;font-size:14px">The solution I would like to see long term is to=
 pull in a single font</span><br style=3D"font-family:Verdana,Geneva,sans-s=
erif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;f=
ont-size:14px">file, or single svg sprite file, and utilize webpacks built =
in tree</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:=
14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">=
shaking to keep it small.</span></blockquote><div><br></div><div>With a sin=
gle SVG sprite or definition file, tree shaking may not be needed. Based on=
</div><div>the small number of icons we are using the file after compressio=
n should be relatively</div><div>small. We can test that, but the SVG icons=
 have been typically smaller than font icons.=C2=A0</div><div><br></div><bl=
ockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex" class=3D"gmail_quote"><br style=3D"font-family:Ver=
dana,Geneva,sans-serif;font-size:14px"><br style=3D"font-family:Verdana,Gen=
eva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sa=
ns-serif;font-size:14px">With that said, my opinions between the two aren&#=
39;t that strong, as I</span><br style=3D"font-family:Verdana,Geneva,sans-s=
erif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;f=
ont-size:14px">believe functionally both options can achieve the same resul=
t.=C2=A0 Anyone</span><br style=3D"font-family:Verdana,Geneva,sans-serif;fo=
nt-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-siz=
e:14px">that=E2=80=99s willing to push patches enabling one or another with=
out breaking</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-=
size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px">something, or effecting our build stats would be appreciated by me.=C2=
=A0 I</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14=
px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">co=
uld certainly be convinced that inline SVG, using the webpack backend</span=
><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span s=
tyle=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">was the bette=
r option, but I would really like to see some numbers on</span><br style=3D=
"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-=
family:Verdana,Geneva,sans-serif;font-size:14px">checked-in code size, fina=
l rootfs size, or start-up performance</span><br style=3D"font-family:Verda=
na,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Gen=
eva,sans-serif;font-size:14px">(preferably all 3).</span><br style=3D"font-=
family:Verdana,Geneva,sans-serif;font-size:14px"><br style=3D"font-family:V=
erdana,Geneva,sans-serif;font-size:14px"></blockquote><div><br></div><div>I=
 think the SVG sprite of definition option would be simple to implement and=
 should not</div><div>require too much work to implement.</div><div>=C2=A0<=
/div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex" class=3D"gmail_quote"><span style=3D"font-=
family:Verdana,Geneva,sans-serif;font-size:14px">An example of setting of w=
ebpack up for fontawesome font tree shaking:</span><br style=3D"font-family=
:Verdana,Geneva,sans-serif;font-size:14px"><a href=3D"https://fontawesome.c=
om/how-to-use/with-the-api/other/tree-shaking" rel=3D"noreferrer" style=3D"=
font-family:Verdana,Geneva,sans-serif;font-size:14px" target=3D"_blank">htt=
ps://fontawesome.com/how-to-use/with-the-api/other/tree-shaking</a><br styl=
e=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><br style=3D"fon=
t-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-fami=
ly:Verdana,Geneva,sans-serif;font-size:14px">An example of using fontawesom=
e with SVG sprites:</span><br style=3D"font-family:Verdana,Geneva,sans-seri=
f;font-size:14px"><a href=3D"https://fontawesome.com/how-to-use/on-the-web/=
advanced/svg-sprites" rel=3D"noreferrer" style=3D"font-family:Verdana,Genev=
a,sans-serif;font-size:14px" target=3D"_blank">https://fontawesome.com/how-=
to-use/on-the-web/advanced/svg-sprites</a></blockquote><div><br></div><div>=
The SVG sprite example above is exactly what I&#39;m referring to. And the =
icomoon tool (I refer to=C2=A0</div><div>that below in point #2 I have been=
 using provides all the code, including the SVG sprite.=C2=A0=C2=A0</div><d=
iv><br></div><blockquote style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex" class=3D"gmail_quote"><br style=3D=
"font-family:Verdana,Geneva,sans-serif;font-size:14px"><br style=3D"font-fa=
mily:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:V=
erdana,Geneva,sans-serif;font-size:14px">I think the important thing we nee=
d to be clear on and document is why</span><br style=3D"font-family:Verdana=
,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Genev=
a,sans-serif;font-size:14px">we&#39;re making the change we&#39;re making.=
=C2=A0 Today the webui uses inline svg</span><br style=3D"font-family:Verda=
na,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Gen=
eva,sans-serif;font-size:14px">for the navbar icons;=C2=A0 Because the way =
it&#39;s built, those are required at</span><br style=3D"font-family:Verdan=
a,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Gene=
va,sans-serif;font-size:14px">initial page load, and we don&#39;t want to h=
old up the initial page load</span><br style=3D"font-family:Verdana,Geneva,=
sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-s=
erif;font-size:14px">while we incur another round trip time to query the BM=
C for all of the</span><br style=3D"font-family:Verdana,Geneva,sans-serif;f=
ont-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-si=
ze:14px">icons.=C2=A0 The glyficons are loaded after the user is logged in.=
=C2=A0 Doing</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-=
size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px">this spreads out the BMC load in the most common case, and doesn&#39;t=
 incur</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">a=
 large payload download for loading the login page.</span><br style=3D"font=
-family:Verdana,Geneva,sans-serif;font-size:14px"><br style=3D"font-family:=
Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdan=
a,Geneva,sans-serif;font-size:14px">One thing to be careful of with inline =
SVG:=C2=A0 Some of the SVG keywords</span><br style=3D"font-family:Verdana,=
Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva=
,sans-serif;font-size:14px">will trigger the browsers content security poli=
cy.=C2=A0 Because SVG icons</span><br style=3D"font-family:Verdana,Geneva,s=
ans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-se=
rif;font-size:14px">are read in as XML, things like &quot;style&quot; keywo=
rds need to be removed,</span><br style=3D"font-family:Verdana,Geneva,sans-=
serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;=
font-size:14px">similar to this review.</span><br style=3D"font-family:Verd=
ana,Geneva,sans-serif;font-size:14px"><a href=3D"https://gerrit.openbmc-pro=
ject.xyz/c/openbmc/phosphor-webui/+/16949" rel=3D"noreferrer" style=3D"font=
-family:Verdana,Geneva,sans-serif;font-size:14px" target=3D"_blank">https:/=
/gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/16949</a><br style=
=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><br style=3D"font=
-family:Verdana,Geneva,sans-serif;font-size:14px"></blockquote><div><br></d=
iv><div>I like the idea of using an SVG sprite. Using the &lt;use&gt; eleme=
nt (which would required a small polyfill for IE 11)=C2=A0</div><div>the im=
plementation is as simple as using font icons. We would only have the icons=
 we needed to use and the file size=C2=A0</div><div>(which we can test and =
evaluate) would be small since we don&#39;t need to include the entire font=
-awesome library.</div><div><br></div><div>Some reasons I prefer the SVG sp=
rite is:</div><div>1. It would allow for easy conversion downstream for any=
one that wants to use a different icon set</div><div>2. Implementation is c=
onsistent and can be easily documented</div><div><br></div><div>We can keep=
 the login icons inlined to minimize the load if we think loading the SVG s=
prite is too much of a load.</div><div><br></div><div><br></div><blockquote=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex" class=3D"gmail_quote"><span style=3D"font-family:Verdana,G=
eneva,sans-serif;font-size:14px">2. Should we allow library icons?</span><b=
r style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span styl=
e=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">This one is impo=
rtant to me.=C2=A0 To highlight the importance, let me lay</span><br style=
=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"fo=
nt-family:Verdana,Geneva,sans-serif;font-size:14px">out a hypothetical scen=
ario.</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14=
px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">De=
veloper X wants to build a new page on the webui to allow the BMC to</span>=
<br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span st=
yle=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">tweet system f=
ailures (side note, this would be an awesome way to</span><br style=3D"font=
-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-famil=
y:Verdana,Geneva,sans-serif;font-size:14px">implement a hosted logger in th=
e cloud for free).=C2=A0 Said developer is not</span><br style=3D"font-fami=
ly:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Ver=
dana,Geneva,sans-serif;font-size:14px">a visual designer, nor has the abili=
ty to build icons.=C2=A0 They pull in the</span><br style=3D"font-family:Ve=
rdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,=
Geneva,sans-serif;font-size:14px">various buttons, textboxes, and forms fro=
m throughout the webui to build</span><br style=3D"font-family:Verdana,Gene=
va,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,san=
s-serif;font-size:14px">their UI, following the style guide while they do i=
t with the existing</span><br style=3D"font-family:Verdana,Geneva,sans-seri=
f;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font=
-size:14px">CSS.=C2=A0 For their navbar icon, they pull in the twitter icon=
 here:</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px"><a href=3D"https://fontawesome.com/icons/twitter?style=3Dbrands" rel=
=3D"noreferrer" style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14=
px" target=3D"_blank">https://fontawesome.com/icons/twitter?style=3Dbrands<=
/a><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span=
 style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">The icon is=
 responsive, uses vector graphics, is properly sized, and</span><br style=
=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"fo=
nt-family:Verdana,Geneva,sans-serif;font-size:14px">adds a negligible size =
to the final rootfs.</span><br style=3D"font-family:Verdana,Geneva,sans-ser=
if;font-size:14px"><br style=3D"font-family:Verdana,Geneva,sans-serif;font-=
size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px">Do we reject their code because they didn&#39;t create their own icon?=
</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><=
br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span sty=
le=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">I would advocat=
e the answer is no.=C2=A0 I&#39;m having trouble getting a read on</span><b=
r style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span styl=
e=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">this, but it sou=
nds like the answer that is being proposed is that we</span><br style=3D"fo=
nt-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-fam=
ily:Verdana,Geneva,sans-serif;font-size:14px">should start enforcing icon s=
tyle before merge for &quot;consistency&quot;, but</span><br style=3D"font-=
family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family=
:Verdana,Geneva,sans-serif;font-size:14px">I&#39;m not really following the=
 end goal.=C2=A0 If someone is wanting to remove</span><br style=3D"font-fa=
mily:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:V=
erdana,Geneva,sans-serif;font-size:14px">pages because the icon doesn&#39;t=
 have a consistent style, that is easy</span><br style=3D"font-family:Verda=
na,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Gen=
eva,sans-serif;font-size:14px">enough to do in a config in the per-machine/=
per-company repositories.</span></blockquote><div><br></div><div>Using an S=
VG sprite would make it easy to simply update the downstream SVG sprite wit=
hout</div><div>having to update any code.</div><div>=C2=A0</div><blockquote=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex" class=3D"gmail_quote"><br style=3D"font-family:Verdana,Gen=
eva,sans-serif;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sa=
ns-serif;font-size:14px">If someone wants to make the style more consistent=
, they can certainly</span><br style=3D"font-family:Verdana,Geneva,sans-ser=
if;font-size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;fon=
t-size:14px">push new custom icons to do that.=C2=A0 I think master branch =
of the webui</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-=
size:14px"><span style=3D"font-family:Verdana,Geneva,sans-serif;font-size:1=
4px">needs to point at a web page that enables as much functionality as we<=
/span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><s=
pan style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">can.=C2=
=A0 Having to create custom icons is one more reason for people to</span><b=
r style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span styl=
e=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px">fork the codebas=
e and not contribute back, and we want to avoid that as</span><br style=3D"=
font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-f=
amily:Verdana,Geneva,sans-serif;font-size:14px">much as possible.</span><br=
 style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><br style=
=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"fo=
nt-family:Verdana,Geneva,sans-serif;font-size:14px">Said another way, I wou=
ld much rather have a first class UI feature with</span><br style=3D"font-f=
amily:Verdana,Geneva,sans-serif;font-size:14px"><span style=3D"font-family:=
Verdana,Geneva,sans-serif;font-size:14px">a stock icon, than no feature at =
all.</span><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14p=
x"><br style=3D"font-family:Verdana,Geneva,sans-serif;font-size:14px"></blo=
ckquote><div>=C2=A0</div><div>I agree with the use of a consistent and open=
 icon set, like font awesome. I have been using</div><div>a great tool call=
ed icomoon (free),=C2=A0<a href=3D"https://icomoon.io/" target=3D"_blank">h=
ttps://icomoon.io/</a> to manage my icon sets. It&#39;s fantastic</div><div=
>because we can use font awesome and can import icons if needed. The icon s=
et can be=C2=A0</div><div>saved as a JSON file and even added to the reposi=
tory if needed, so that anyone could</div><div>import it to icomoon and add=
 or update icons using font awesome or any number of other</div><div>free i=
con sets and then have an updated SVG sprite generated, as well as download=
ing</div><div>the updated icon set config.=C2=A0</div><div>=C2=A0</div></di=
v><div dir=3D"ltr"><div><div dir=3D"ltr" class=3D"m_-1169918046772013318gma=
il_signature"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><span styl=
e=3D"font-family:arial;font-size:small">Derick Montague</span><div style=3D=
"font-family:arial;font-size:small">* * * * * * * * * * * * * * * *=C2=A0</=
div></div></div></div></div></div></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div class=3D"m_-1169918046772013=
318gmail-m_2816826239589601285socmaildefaultfont" dir=3D"ltr" style=3D"font=
-family:Verdana,Geneva,sans-serif;font-size:10.5pt"><div dir=3D"ltr"><div d=
ir=3D"ltr">From:=C2=A0<strong dir=3D"auto">Ed Tanous</strong>=C2=A0<span di=
r=3D"ltr">&lt;<a href=3D"mailto:ed.tanous@intel.com" target=3D"_blank">ed.t=
anous@intel.com</a>&gt;</span><br>Date: Mon, Jan 28, 2019 at 1:13 PM<br>Sub=
ject: WebUI Fonts<br>To:=C2=A0<a href=3D"mailto:openbmc@lists.ozlabs.org" t=
arget=3D"_blank">openbmc@lists.ozlabs.org</a>=C2=A0&lt;<a href=3D"mailto:op=
enbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<=
/div><br><br>Let=E2=80=99s continue the discussion we had on the call with =
the list, and see<br>if there=E2=80=99s anyone else interested in the topic=
.<br><br>From my understanding, there are two issues here at play in the we=
bui:<br><br>1. Should we be consistent about SVG icons versus font icons?=
=C2=A0 Which<br>should we use?<br>My take on this is that we should do what=
ever is easiest to maintain.<br>Today we use both custom SVGs inline in the=
 nav bar, as well as some<br>font icons from the glyficons pack.=C2=A0 Ther=
e were some concerns about<br>accessibility on font icons that we should op=
en a bug up on github and<br>understand.=C2=A0 I would really like if that =
bug led to some documentation<br>about how we handle accessibility, and wha=
t we would like to see from<br>patchsets going forward in clear and concise=
 rules, and a patchset to<br>make the UI as it stands consistent in this re=
gard.<br>The solution I would like to see long term is to pull in a single =
font<br>file, or single svg sprite file, and utilize webpacks built in tree=
<br>shaking to keep it small.<br><br>With that said, my opinions between th=
e two aren&#39;t that strong, as I<br>believe functionally both options can=
 achieve the same result.=C2=A0 Anyone<br>that=E2=80=99s willing to push pa=
tches enabling one or another without breaking<br>something, or effecting o=
ur build stats would be appreciated by me.=C2=A0 I<br>could certainly be co=
nvinced that inline SVG, using the webpack backend<br>was the better option=
, but I would really like to see some numbers on<br>checked-in code size, f=
inal rootfs size, or start-up performance<br>(preferably all 3).<br><br>An =
example of setting of webpack up for fontawesome font tree shaking:<br><a h=
ref=3D"https://fontawesome.com/how-to-use/with-the-api/other/tree-shaking" =
rel=3D"noreferrer" target=3D"_blank">https://fontawesome.com/how-to-use/wit=
h-the-api/other/tree-shaking</a><br><br>An example of using fontawesome wit=
h SVG sprites:<br><a href=3D"https://fontawesome.com/how-to-use/on-the-web/=
advanced/svg-sprites" rel=3D"noreferrer" target=3D"_blank">https://fontawes=
ome.com/how-to-use/on-the-web/advanced/svg-sprites</a><br><br>I think the i=
mportant thing we need to be clear on and document is why<br>we&#39;re maki=
ng the change we&#39;re making.=C2=A0 Today the webui uses inline svg<br>fo=
r the navbar icons;=C2=A0 Because the way it&#39;s built, those are require=
d at<br>initial page load, and we don&#39;t want to hold up the initial pag=
e load<br>while we incur another round trip time to query the BMC for all o=
f the<br>icons.=C2=A0 The glyficons are loaded after the user is logged in.=
=C2=A0 Doing<br>this spreads out the BMC load in the most common case, and =
doesn&#39;t incur<br>a large payload download for loading the login page.<b=
r><br>One thing to be careful of with inline SVG:=C2=A0 Some of the SVG key=
words<br>will trigger the browsers content security policy.=C2=A0 Because S=
VG icons<br>are read in as XML, things like &quot;style&quot; keywords need=
 to be removed,<br>similar to this review.<br><a href=3D"https://gerrit.ope=
nbmc-project.xyz/c/openbmc/phosphor-webui/+/16949" rel=3D"noreferrer" targe=
t=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-webui/+/=
16949</a><br><br>2. Should we allow library icons?<br>This one is important=
 to me.=C2=A0 To highlight the importance, let me lay<br>out a hypothetical=
 scenario.<br>Developer X wants to build a new page on the webui to allow t=
he BMC to<br>tweet system failures (side note, this would be an awesome way=
 to<br>implement a hosted logger in the cloud for free).=C2=A0 Said develop=
er is not<br>a visual designer, nor has the ability to build icons.=C2=A0 T=
hey pull in the<br>various buttons, textboxes, and forms from throughout th=
e webui to build<br>their UI, following the style guide while they do it wi=
th the existing<br>CSS.=C2=A0 For their navbar icon, they pull in the twitt=
er icon here:<br><a href=3D"https://fontawesome.com/icons/twitter?style=3Db=
rands" rel=3D"noreferrer" target=3D"_blank">https://fontawesome.com/icons/t=
witter?style=3Dbrands</a><br>The icon is responsive, uses vector graphics, =
is properly sized, and<br>adds a negligible size to the final rootfs.<br><b=
r>Do we reject their code because they didn&#39;t create their own icon?<br=
><br>I would advocate the answer is no.=C2=A0 I&#39;m having trouble gettin=
g a read on<br>this, but it sounds like the answer that is being proposed i=
s that we<br>should start enforcing icon style before merge for &quot;consi=
stency&quot;, but<br>I&#39;m not really following the end goal.=C2=A0 If so=
meone is wanting to remove<br>pages because the icon doesn&#39;t have a con=
sistent style, that is easy<br>enough to do in a config in the per-machine/=
per-company repositories.<br>If someone wants to make the style more consis=
tent, they can certainly<br>push new custom icons to do that.=C2=A0 I think=
 master branch of the webui<br>needs to point at a web page that enables as=
 much functionality as we<br>can.=C2=A0 Having to create custom icons is on=
e more reason for people to<br>fork the codebase and not contribute back, a=
nd we want to avoid that as<br>much as possible.<br><br>Said another way, I=
 would much rather have a first class UI feature with<br>a stock icon, than=
 no feature at all.<br><br>-Ed<br></div></div>
<br>
</blockquote></div></div></div>

--00000000000077f0830580a03983--

--00000000000077f0860580a03988
Content-Type: image/gif; name="Image.15432496725930.gif"
Content-Disposition: attachment; filename="Image.15432496725930.gif"
Content-Transfer-Encoding: base64
Content-ID: <1689b878c2ba32ed4471>
X-Attachment-Id: 1689b878c2ba32ed4471

R0lGODlhUwAeALMAAP///wCKvwCz7wA+abLc7H/E33/Z90yt0kzK9LLo+gAAAAAAAAAAAAAAAAAA
AAAAACH5BAAAAAAALAAAAABTAB4AAAT/cMhJKwAi680zMlcIBGRpkmJ6rkEaVjB1dXRnJCJ7Ei5A
6KaecEgsGo/IpHLJbKZi0FltugGNgCWe6IdF9aAxKXV86ZIKqYK55Wy73/C4XBkedlyGuwqIvqiB
dDBEeiJ5GwguXSGKc42Oj5CRInVCYzY9XQcAB4xIlD2WVUIrfyWlZyuSqqusrV+CdqEZVok7Vyw+
qUmfLrIatDm2gFxBrsbHyG+8KYQhhhqIeyZapwF9xCWBFrEbeM1ltuDZF9heyefo6RdgsL414ixa
AKV9uYCv7BNi7r/wK/K3tmARUeAAQHWOCBRQWA9howMFCRzIJwMDPwE3gukAqKZhuRMhFQosFElR
n0VfH2ptVJHiYzE/EAFEAAA7
--00000000000077f0860580a03988--
