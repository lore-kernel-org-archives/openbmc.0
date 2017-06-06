Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whcs03G3TzDqL2
 for <openbmc@lists.ozlabs.org>; Tue,  6 Jun 2017 13:40:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fo72r1a+"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id r66so5768288yba.3
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 20:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=cq+u+SpgUTZJsYCR14H+g5FI8UHKPIDVULx8ntjhrDI=;
 b=fo72r1a+dck8PjY17HNxuoDpkZSpAth69ouS99sPntoCWqVZPxKdnyVGOgrOXnezGA
 iU3MHOlnQIrBWajvsx3WfFvYBCKBewPGmbyx1q/mIWozJEe/h+9L2KlslM4snMz2JrPK
 Iwf45/ktTQNZxWYaxiPOXSB9gW0rMf9vdTCja/l7VocUDRo5zAHYEocZz0VT1RORObG6
 UwjO+HTZIiUki7WV0u4N7UW4AHnE55sg7CDUCHKg6kTUEoPCnBb0NbJyhUu0UtFQpLX+
 GgEXAJn+usygXBf6YUJ7BgSBQDlGrcn0GQQZgjM+YMFbIFO/iIvOcbBbgzoFEPb6qIMH
 aybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=cq+u+SpgUTZJsYCR14H+g5FI8UHKPIDVULx8ntjhrDI=;
 b=QRS1l+TnlQBJoOFI07IGLN1mNOedtBxJJVOTXZ2PGW2AMEwm8z8e98jJMHHA7uVHYU
 qzm9L35ZCC/tXyseWLy6zCldJ+FfcVYrNWZ/EddYhASl2lcYN30pHLzqsjlvKasa4722
 EoNx2QEN4Ep19GSxhAWxahz7fGNTuDU1CdHG/j+pWocOFrHQ/ApxuKsFTyJBrTQiCxxp
 LjutTP07kDBdBSgbvX7CLltWnxyK84Q+0z97cHaQIVuKpJOQR0soRAT5qJRX9JTMcrZ9
 lWD3pgYpest9MbEB/oBmPns8YSy8qp9tR3WPtA+KSYXUPfDomYrl22u5ItWl5loi9gCn
 5BhQ==
X-Gm-Message-State: AODbwcAErNZwMOycmNTxxgFSEFGmLkNu7msKq5mbdDNOF3btbLhOoisd
 mGBBTz0G58Ccs1S9r7NIOJMjfWmFPQ==
X-Received: by 10.37.202.140 with SMTP id a134mr1299900ybg.182.1496720418417; 
 Mon, 05 Jun 2017 20:40:18 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Mon, 5 Jun 2017 20:39:57 -0700 (PDT)
In-Reply-To: <bf0c8c88-af0d-529b-bab5-c04e266014f7@linux.vnet.ibm.com>
References: <20170605084954.8512-1-joel@jms.id.au>
 <bf0c8c88-af0d-529b-bab5-c04e266014f7@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 6 Jun 2017 13:09:57 +0930
X-Google-Sender-Auth: GnbRk1tex2yO0sik4IwIz5EeC-A
Message-ID: <CACPK8Xf8wVkRZM-rcM9hw+6tNv0x7zt6hE+fjYSVmrtetx3vTg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix kconfig and makefile
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 06 Jun 2017 03:40:21 -0000

On Tue, Jun 6, 2017 at 4:40 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>
>
> On 06/05/2017 03:49 AM, Joel Stanley wrote:
>>
>> The OCC driver was not buildable. Clean up the makefile and kconfig.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
>
> Thanks Joel, but please don't merge. I just sent up a patch to Kconfig that
> will play nicely with my P8 updates soon, and worked building in-tree for
> me.

Sorry, Lei and I needed this working last night so it was merged then.

Note that we no longer have a submenu for the OCC - it is not required.

Cheers,

Joel
