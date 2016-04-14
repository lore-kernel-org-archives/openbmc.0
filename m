Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from mail.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qm27w6qbrzDq5y
 for <openbmc@lists.ozlabs.org>; Thu, 14 Apr 2016 23:48:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.b=E+6lHDWe; dkim-atps=neutral
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.fuzziesquirrel.com 9D9F420AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fuzziesquirrel.com;
 s=mail; t=1460641721;
 bh=/9W+MvpCSZ8BI5AH+LqT7n8XzSKTAeXs0Sx8cPsljEo=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
 b=E+6lHDWe3kwYgQdZNNARS5xUtLMzYwlOvhn5wNo3dglL/hWyP+bPcowngrSEyTkd0
 f5UN8vsXzqPodnXxR5ObkV6bhsoxEwBWIcX46ldy+ZYWxB00q5HdVcHivgRhcOWB18
 YCE73eOdysxEWFGiVx2eaBOODbYso2as6P0lOenE=
Received: from [192.168.253.29] (unknown [192.168.253.29])
 by mail.fuzziesquirrel.com (Postfix) with ESMTPSA id 8D5BA20AA7;
 Thu, 14 Apr 2016 09:48:40 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH phosphor-rest-server] Add support for serving jsonp
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1459463240.2457.13.camel@aj.id.au>
Date: Thu, 14 Apr 2016 09:48:40 -0400
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <761E1918-7D5E-4F3C-9EA9-375501525A74@fuzziesquirrel.com>
References: <1459266057-23662-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1459463240.2457.13.camel@aj.id.au>
To: andrew@aj.id.au
X-Mailer: Apple Mail (2.3124)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2016 13:48:46 -0000

Hi Andrew

JSONP lets you bypass cross-domain policies in web browsers.  That =
sounds hacky and unsafe, and some people think it is, but the concerns =
with it are all on the client side.

One use case would be writing some javascript on a PC ( so the =
=E2=80=9Corigin=E2=80=9D is the PC ).  The browser running the script =
would not allow xmlhttprequests to the BMC.  We have a web developer =
writing an application doing exactly this:

https://github.com/LRRoberts0122/openbmc =
<https://github.com/LRRoberts0122/openbmc>

thx - brad

> On Mar 31, 2016, at 6:27 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> Hi Brad,
>=20
> On Tue, 2016-03-29 at 10:40 -0500, OpenBMC Patches wrote:
>> Jsonp adds a javascript wrapper to json responses.  It allows client
>> applications to work around cross domain restrictions imposed by some
>> browsers.  For more information on jsonp:
>> https://en.wikipedia.org/wiki/JSONP
>>=20
>> To get a jsonp response, an application adds a callback url parameter
>> with the desired name of the wrapper:
>> https://192.168.252.1/list?callback=3Dmy_callback
>=20
> This description covers the what and the how, but I'm not clear on the
> why. Can you add some words describing the motivation for the change
> and/or use-cases this enables? Maybe it's my ignorance of web
> development shining through :)
>=20
> Cheers,
>=20
> Andrew
>=20
>>=20
>> <!-- Reviewable:start -->
>> ---
>> This change is [<img src=3D"https://reviewable.io/review_button.svg"
>> height=3D"35" align=3D"absmiddle" alt=3D"Reviewable"/>](
>> https://reviewable.io/reviews/openbmc/phosphor-rest-server/17)
>> <!-- Reviewable:end -->
>>=20
>>=20
>> https://github.com/openbmc/phosphor-rest-server/pull/17
>>=20
>> Brad Bishop (1):
>>  Add support for serving jsonp
>>=20
>> obmc-rest | 30 ++++++++++++++++++++++++++++--
>> 1 file changed, 28 insertions(+), 2 deletions(-)
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
