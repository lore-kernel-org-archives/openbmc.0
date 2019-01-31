Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="SesqOi9h"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43rFJP5fY7zDqS9
 for <openbmc@lists.ozlabs.org>; Fri,  1 Feb 2019 09:28:53 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id r11so1974963pgp.6
 for <openbmc@lists.ozlabs.org>; Thu, 31 Jan 2019 14:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ay4DQH40tprjOJUsGW2K2suaJ0QdzZ2Q7p0TqtRZQkI=;
 b=SesqOi9h2kMi+sGIIg2bWLcAiihRSH4o08OQLTV6LLb6WIyLJPUhtlleP0WXBKCWE/
 27kAg+vkLxyxmK5L31AzOMBx82h+y3q+67gXosCeucVwePyu/ULc0F9Sgo7BLlfTTJf5
 tEZ7diS2i0VNIAWwEDi8P01jrl8Cx/fm8/zJ5ZNyNnh9xyMyAKeln3vYSNBlqqjY2/8S
 n3uAdmF0KiTI9fW8Cj4A8ON5/nYjNvjxcqZ2+mngowVsf4l0SYU4o/4rQz6JfqcDRuB8
 b2WbrFOZq4Ps/Y0A1m4IivtNcY3y+zcLMWpNxD5Hlq90LtXqfn2z6a0fkfIB0YLj66QT
 L2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ay4DQH40tprjOJUsGW2K2suaJ0QdzZ2Q7p0TqtRZQkI=;
 b=nFE0iG8Iea25XZbn7BtXgbZvpdDhM4tnRuFybVo5NM/ViQ7Q44ABilEwKexlolJ0Ci
 RdgaTZIl/EwPzjWMaU47fOpcNDvNWBl38EFYu4ngaHMweA+S3KiZCIz4JVIxrGrPGTw9
 QCsNZILXzBarVpnWtZRBn/MoYTP8BkDkWO/mIwnE1Bc1oIdW47j1rA9SA8J02aWzwLxg
 npiuytKgjKFELrlSGXn+KCYIqqKm/1AQ/c8RkFRoAutBXjynOWKH3JEmuoc88BCw1641
 LB+XDVUFoCtNTlM0j5O1BeycE+Zx7kzPlWtxjQ/YPoDqqkouQ24M4wCodaadbGawL5AP
 h19g==
X-Gm-Message-State: AJcUukdYzpyVnTu17FLxHtl7eVtv9lCZPW4Wq1uXc13sgqo2AkWdKwFc
 OIhJ0TthusKMEmcdcblyCYbCFpcxStxqFiorlOd2N2NZ
X-Google-Smtp-Source: ALg8bN4HktQ6Fg0PRWu+4nh7tIDxDuTMg66hBRxK9lDmXZNMpULGo0QE64Vmh52xXsLEnXa1FZB8RnSGp3Vm1ijtWdM=
X-Received: by 2002:a62:26c7:: with SMTP id m190mr37308195pfm.79.1548973731079; 
 Thu, 31 Jan 2019 14:28:51 -0800 (PST)
MIME-Version: 1.0
References: <CAOUmYFTGSMQy2-C6xphK1=-ecVAsb-0WSnB89rcBFBm15QPZcw@mail.gmail.com>
 <8ed86145-296c-72b6-2fd2-989629533d59@intel.com>
 <CAOUmYFTfeWKsPvJLSnEbExVy6+XZ9nNdmK0y_Vvvw94g6Zty+Q@mail.gmail.com>
In-Reply-To: <CAOUmYFTfeWKsPvJLSnEbExVy6+XZ9nNdmK0y_Vvvw94g6Zty+Q@mail.gmail.com>
From: susan jasinski <susantjasinski@gmail.com>
Date: Thu, 31 Jan 2019 16:28:40 -0600
Message-ID: <CANT4Nr+FUh5QfjHodVZa6ci7sMHYXDxYMX44kP+VY_pvd0_+qA@mail.gmail.com>
Subject: Re: WebUI Fonts
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Thu, 31 Jan 2019 22:28:54 -0000

Some additional decisions were made today on IRC:

- Move to the webpack SVG sprite loader
- Guideline is to use the Carbon icon set for upstream build (Carbon
is an open and free icon set created by IBM)
- If a non-Carbon icon is used at some point, the code will NOT be
rejected; anyone can update it with a Carbon icon replacement or leave
it as is

On Tue, Jan 29, 2019 at 9:25 PM Derick <derick.montague@gmail.com> wrote:
>>
>> The first hit I get what I search "webpack icomoon" is a link to a stack
>> overflow with the title "webpack with icomoon does not work".  That's
>> not a great sign, although I haven't dug into the details yet.
>
>
> That looks like an icon font issue that we wouldn't have to deal with
> if we went the SVG sprite route.
>
>>
>> Webpack also has some built-in capabilities for SVG sprites that I
>> haven't had time to look at.  It sounds like that is the current
>> best-practice for webpack.
>> https://github.com/kisenka/svg-sprite-loader
>>
>> If we're looking at dropping webpack, or doing a two stage build
>> (icomoon then webpack) that's something that needs a longer discussion.
>> Alternatively webpack is open source, we could certainly just go fix
>> icomoon support.
>
>
> This looks really good. All we need to do is add
> the SVGs to a directory and import in order to use it. The
> process is much simpler than the icomoon approach and downstream
> it's as simple as replacing the SVG to use a different icon.
>
>> Say more on this point......  I'm not sure I understand.  Wont people
>> always have to override some file to update icons?
>
>
> The svg-sprite-loader handles this well. If someone wants to use a
> different Twitter icon, they just replace it downstream. No actual markup
> would need to change, which is what I meant when I said no coding
> would be needed.
>
> The icomoon approaceh downstream would use a different SVG sprite, but
> building and generating with iconmoon is cumbersome compared
> to having webpack do the work for us!
>
>> My preference would be to use the built-in webpack sprite loader, under
>> the assumption that it works better, and will be easier to maintain long
>> term, but I'm happy to support icomoon if it's a better tool.
>
>
> Looking at the loader, I think this is the right direction. If we don't encounter any unforeseen issues
> this seems like the simplest approach.
>
> On Tue, Jan 29, 2019 at 4:46 PM Ed Tanous <ed.tanous@intel.com> wrote:
>>
>>
>> On 1/29/19 2:21 PM, Derick wrote:
>> >
>> >
>> > I have an accessibility audit of our icons on a todo list and I'd love
>> > to create the documentation to help make the
>> > application more inclusive! I just need to prioritize the time with
>> > another project.
>> I didn't mean to call you out.  I realize we're all busy :)
>>
>> >
>> > small. We can test that, but the SVG icons have been typically smaller
>> > than font icons.
>> That sounds like a great reason to use SVG over fonts.  If we can show
>> that in a meaningful way, I'm happy to support moving the UI over to SVG.
>>
>> >
>> >
>> > The SVG sprite example above is exactly what I'm referring to. And the
>> > icomoon tool (I refer to
>> > that below in point #2 I have been using provides all the code,
>> > including the SVG sprite.
>> The first hit I get what I search "webpack icomoon" is a link to a stack
>> overflow with the title "webpack with icomoon does not work".  That's
>> not a great sign, although I haven't dug into the details yet.
>>
>> Webpack also has some built-in capabilities for SVG sprites that I
>> haven't had time to look at.  It sounds like that is the current
>> best-practice for webpack.
>> https://github.com/kisenka/svg-sprite-loader
>>
>> If we're looking at dropping webpack, or doing a two stage build
>> (icomoon then webpack) that's something that needs a longer discussion.
>> Alternatively webpack is open source, we could certainly just go fix
>> icomoon support.
>>
>> >
>> >
>> > I like the idea of using an SVG sprite. Using the <use> element (which
>> > would required a small polyfill for IE 11)
>> > the implementation is as simple as using font icons. We would only have
>> > the icons we needed to use and the file size
>> > (which we can test and evaluate) would be small since we don't need to
>> > include the entire font-awesome library.
>> >
>> > Some reasons I prefer the SVG sprite is:
>> > 1. It would allow for easy conversion downstream for anyone that wants
>> > to use a different icon set
>> > 2. Implementation is consistent and can be easily documented
>>
>> This is exactly the kind of background I was looking for on why this
>> change is worth it, as well as trade offs and things that are required.
>>
>> >
>> > We can keep the login icons inlined to minimize the load if we think
>> > loading the SVG sprite is too much of a load.
>>
>> I think a single SVG sprite doesn't add too much load.  It's when we're
>> pulling 12 different icons separately that we need to pay attention.
>> Today, rendering the initial login page load requires 4 files, one of
>> which is already an SVG (the openbmc logo), and 276KB of payload.   If
>> we go to svg sprites, presumably the SVG file just gets bigger, but
>> we're still requesting the same number of resources.  We should be in
>> good shape.
>>
>> >
>> >
>> > Using an SVG sprite would make it easy to simply update the downstream
>> > SVG sprite without
>> > having to update any code.
>> >
>>
>> Say more on this point......  I'm not sure I understand.  Wont people
>> always have to override some file to update icons?
>> >
>> >
>> > I agree with the use of a consistent and open icon set, like font
>> > awesome. I have been using
>> > a great tool called icomoon (free), https://icomoon.io/ to manage my
>> > icon sets. It's fantastic
>> > because we can use font awesome and can import icons if needed. The icon
>> > set can be
>> > saved as a JSON file and even added to the repository if needed, so that
>> > anyone could
>> > import it to icomoon and add or update icons using font awesome or any
>> > number of other
>> > free icon sets and then have an updated SVG sprite generated, as well as
>> > downloading
>> > the updated icon set config.
>>
>>
>> My preference would be to use the built-in webpack sprite loader, under
>> the assumption that it works better, and will be easier to maintain long
>> term, but I'm happy to support icomoon if it's a better tool.
>>
>>
>>
>>
>> Moving the webui to SVG sprites sounds like a positive thing to do, and
>> has my support.  Looking forward to seeing the patchsets.
>>
>> -Ed
>>
