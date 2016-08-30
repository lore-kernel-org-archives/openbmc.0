Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sNX8g6RxgzDr5y
 for <openbmc@lists.ozlabs.org>; Tue, 30 Aug 2016 12:12:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=ynqQWXyw; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id 49so409020uat.0
 for <openbmc@lists.ozlabs.org>; Mon, 29 Aug 2016 19:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=1OGPBqxrez36TfwlYOSXwZvyqvE4CARBGyfRjuTuj5c=;
 b=ynqQWXywz+3KEzQaiMiL88qPx09+gV3z0TcAn1MaWWdyAbo5OcHiMeBBdBEHAYuSPL
 pxFdjqjEr5IRq222VwO0mBZwdRVAMf/TFX3Z16J03Fs6AS898W0ZOzK3efIJoZmNZ3if
 gop7nF9bEb47alqjOQtUQMxit1Pv4KKBX4Ul6PpfkHfAsIj4P2AfrKlkmgacrQziIc87
 EyzaEgac5Re/RUaGytNj/Ye3FmhKCbDXBwwScuSFx9MFrFIQMxzoNjBCV0p+0rdvu84q
 StIuI0F85Nd18xrSKRJZPf5hHM+KhP49MMEw/q9zElZM580E7W3nJmkG/OFnIPAavYI5
 xp+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=1OGPBqxrez36TfwlYOSXwZvyqvE4CARBGyfRjuTuj5c=;
 b=HOgchq2rROBwLize3UKWbg/K5x3Tx80SvFBLvs5WM027X5cT+PVaXOvlDznli+WBVM
 VU1xxuHGOlRkOb3FGISRqsVdMTzioJN/N+nTPW6tyDRikPe9Famh/F7F/W2g8cFiWIIq
 nySh+XbxXDWqBaUZ2tTr6Gk2ktXTOFZSzmeLc43jJiU/I2RfIQAMVDSXsYMAAA0XPMHE
 I8akvbnz34rAHKPU8bjMVunRKMrRvIWmGzEjgGumODLUIH9/HPQAxRVxm1BcYW5CL23+
 vtpY7dvpYPZjwRrI8FiRK6shwgGi6avFPh1ewlEQm9ir0fmWaiKqZhUFfA37m6/QcLNX
 pwJA==
X-Gm-Message-State: AE9vXwNHmuYH7UuEKTjCpwa/C4CO8rB7reN8eaFjRqWO5N8hQEtnai6tUwXFOm15+JTrOy94KvSpSC5+BYWIRw==
X-Received: by 10.31.134.195 with SMTP id i186mr787302vkd.21.1472523137478;
 Mon, 29 Aug 2016 19:12:17 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.159.38.76 with HTTP; Mon, 29 Aug 2016 19:11:56 -0700 (PDT)
In-Reply-To: <1472522143.5707.102.camel@aj.id.au>
References: <20160830014318.26711-1-joel@jms.id.au>
 <1472522143.5707.102.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 30 Aug 2016 11:41:56 +0930
X-Google-Sender-Auth: IO4nspxQgmEbku4358iY-JQP0eU
Message-ID: <CACPK8Xewtr=r2ZmzYv-voJx0pXKKjfRv51dV53QN1X_Mfhqhzw@mail.gmail.com>
Subject: Re: [PATCH] arm/dts/aspeed: Alias vuart as ttyS5
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 30 Aug 2016 02:12:20 -0000

On Tue, Aug 30, 2016 at 11:25 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2016-08-30 at 11:13 +0930, Joel Stanley wrote:
>> OpenBMC userspace expects the vuart to be at /dev/ttyS5. The userspace
>> will soon use udev to correctly identify the vuart, however for now we
>> will un-break existing images by adding the alias.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> NAK, as userspace no-longer expects the vuart to be at ttyS5:
>
> https://gerrit.openbmc-project.xyz/#/c/293/

Agreed. We will implement the udev solution to avoid this regressing
in the future.

https://github.com/openbmc/openbmc/issues/528#issuecomment-243310495

Cheers,

Joel
