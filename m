Return-Path: <ross.burton@intel.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8Hyk1zdGzDqBS
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 23:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b=FF4PMbWs; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id d62so22588410iof.2
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 06:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=v6c75U8Mb/krRVfZfvgU+3PCr8W4QK4bjK0/oTP7qug=;
 b=FF4PMbWsor5v72301WTTVJxruNprB15T+3/YJwEt4UwjRYjV4uCAeZhBSAWuppTTmV
 RIj36TGi7QW7caCtJ8s47nA2+y6Eym4PEeaA/4/n/jMuvWyGDDGjerQeF1m2DA3tJamM
 1KD+DnNNV4F1mCc6bAHSm9MXXFHg9ZJEXZxdGjJ8ic436pDJVt9rx+ldDj6CAk2dKTjs
 JuTKIvuU3a589L1yrq5xVk0+D/iXeAMJp0oCTT4NcPVMfqYR0mCHf5MftG48IGL8Kful
 PyxYRDMqdbbjCqTi1ait7to62jfeXO8qUxx0YIwq1grSEWj6PTsf2Sn1/YP4n4a8bKRx
 Vq7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=v6c75U8Mb/krRVfZfvgU+3PCr8W4QK4bjK0/oTP7qug=;
 b=HOURCdWRzwqo/5VR7RBjz+g87JZHGbgT+7yAnOYPLaTz7JXF3vW8Xe/EHoz/HodItO
 QgqPTRhbSncWwjxH4qBDZ+ak/anXBwMeoJK1bwb2PO4nR0LZNmUm6K23KhESMYPbmQWi
 HdYDU2NJESZsOE97h/PkcimBTD+L/3TyuOqg757OJTRNnt5pJDdvDgOQoKNccGgBDrqv
 IS/uitaX9B/jvKt8Mq8SD7u3fw2/rNh+2HSg0ct33/iWcjprIArl3Kzr3KzqqBFFtiyt
 18ntLenhtxoaySN27NQJ+iaVF5bx6diQr8jy4AfL0xtekzq+s+ommU/VK2i8kK7oyAFT
 uGUg==
X-Gm-Message-State: AOPr4FXwLGR0wxUQV+c7KQYqDa6ymSlucJ4Vz3TJi/bMw7UPlWS28z0Qbh9JLx9nnlMd3RNoTzYvHR/3FDREHRvd
X-Received: by 10.36.120.87 with SMTP id p84mr1077481itc.38.1463491259932;
 Tue, 17 May 2016 06:20:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 17 May 2016 06:20:40 -0700 (PDT)
In-Reply-To: <1463447715.2703.112.camel@aj.id.au>
References: <1463447715.2703.112.camel@aj.id.au>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 May 2016 14:20:40 +0100
Message-ID: <CAJTo0LbX7qrAc5e0OSJzTJ=ish7rLuGzm9LA7LbKF4DK+jy+PA@mail.gmail.com>
Subject: Re: [yocto] Extending runqemu/runqemu-internal with new machines
To: andrew@aj.id.au
Cc: Yocto Project <yocto@yoctoproject.org>,
 Patrick Williams <patrick@stwcx.xyz>, OpenBMC <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a114ac70aae5c220533099cd6
X-Mailman-Approved-At: Wed, 18 May 2016 01:27:30 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 17 May 2016 13:21:03 -0000

--001a114ac70aae5c220533099cd6
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 02:15, Andrew Jeffery <andrew@aj.id.au> wrote:

> Is there a better way to work that might avoid these issues?
> Alternatively, should we start looking at reworking the
> runqemu/runqemu-internal scripts such that we don't have to patch them
> to support our use-case? If so, what sort of approach would the
> community be happy with?
>

Dig back a few weeks and you'll a RFC series by Robert Yang refactoring
runqemu for exactly this problem.  I've not yet looked at it myself but if
you could see if that solves your problems then that would be much
appreciated.

Ross

--001a114ac70aae5c220533099cd6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 02:15, Andrew Jeffery <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:andrew@aj.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div>Is there a better way to work tha=
t might avoid these issues?<br>
Alternatively, should we start looking at reworking the<br>
runqemu/runqemu-internal scripts such that we don&#39;t have to patch them<=
br>
to support our use-case? If so, what sort of approach would the<br>
community be happy with?</div></blockquote></div><br>Dig back a few weeks a=
nd you&#39;ll a RFC series by Robert Yang refactoring runqemu for exactly t=
his problem.=C2=A0 I&#39;ve not yet looked at it myself but if you could se=
e if that solves your problems then that would be much appreciated.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a114ac70aae5c220533099cd6--
