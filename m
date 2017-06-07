Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x232.google.com (mail-yw0-x232.google.com
 [IPv6:2607:f8b0:4002:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wjGj45r3nzDqKY
 for <openbmc@lists.ozlabs.org>; Wed,  7 Jun 2017 15:05:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WjITSJFE"; 
 dkim-atps=neutral
Received: by mail-yw0-x232.google.com with SMTP id l75so707568ywc.3
 for <openbmc@lists.ozlabs.org>; Tue, 06 Jun 2017 22:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=kT8hFMm9oHYTK9MDACWJUd+3JjmmsNoK97l5+xNyThA=;
 b=WjITSJFEJL0/HMtoZrTbZBPtBXJc4kKnlt3bHTdX9vfd6sqZlqIScezNF1i5/1/TaV
 KIsqjmX/awEc0xRMsE+QkDCZc6AL45SZIV4YMl4JMNFwoYsT7ZbUcuB02sMXT2vCRBra
 8W73oamOWCyzLol+Xcvb87AMNXA/eqsUnEFL/49ul9hGWOH3gUcIV9VQdjGBPStQnBWY
 DGEUu0wYCMyqWXU4k9M0GgHOYkgVPPvhBCmek+Z3H5PBGelGV0erjLdMZSaino+H46aA
 pGfj8UukphwE0/ldz4FOg83DxL41rgPK7Dhf0h9V09Y+guGJzb6GiA89fnGZ91Yu4Ur+
 JoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=kT8hFMm9oHYTK9MDACWJUd+3JjmmsNoK97l5+xNyThA=;
 b=OBQhENK/fgewXvMtLw+RUAxfwR3vyFgKOAMKAQ2r8JjZQ3s66og5dDwmrZ1tClr8mc
 yuQ+ubMP07XM9wa2NFPylmE7RbOY6noBVfmEbqOBxLjVki8HLMvQOUEGh7948DI2QZ2G
 YPr6lMziPvoN/Nsm7L+6ZroI76loh0DTDWchNiTSrbxIGC5wV6ylUXyJtoj+8B4Htoqj
 5tBaaoN1bG9irHo9+2uhfsbmsZ3gwkkq9OAuOAPp+cQVQJwe66yUHCUXpM0TsT+EATCP
 b75YpRSb1H3TtZcA1Qe9S6MjkiEqJYRtCC93LjYfHWC0Cfp+ja5NKbuDlNlPnlhTh80e
 PtDA==
X-Gm-Message-State: AODbwcDsTCpbTWRIbNIpvVqocA7IwEOCL0SzkrIf9hQxC3ZlSPPY9ypY
 Um5rMI4VtDf8N8Vfs6Ka8Hml/bQhQQ==
X-Received: by 10.13.212.69 with SMTP id w66mr4913269ywd.164.1496811941689;
 Tue, 06 Jun 2017 22:05:41 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.174.2 with HTTP; Tue, 6 Jun 2017 22:05:21 -0700 (PDT)
In-Reply-To: <76e2515b-1cfe-4663-1676-20f1e27fb9ac@linux.vnet.ibm.com>
References: <76e2515b-1cfe-4663-1676-20f1e27fb9ac@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 7 Jun 2017 14:35:21 +0930
X-Google-Sender-Auth: RciaHp_MPKpUyOWXETV050A7w7s
Message-ID: <CACPK8Xcdo6RqQFTP+B=+eQxDZ2KJTE+rj3LkSp9Ke362Ke6S=Q@mail.gmail.com>
Subject: Re: UCD registers for fault analysis
To: Matt Spinler <mspinler@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 07 Jun 2017 05:05:45 -0000

Hi Matt,

On Tue, Jun 6, 2017 at 5:40 AM, Matt Spinler
<mspinler@linux.vnet.ibm.com> wrote:
> Hi Joel,
>
> I opened issue https://github.com/openbmc/openbmc/issues/1727 to describe
> some UCD90160 registers we need to be able to access in order to do power
> fault analysis.   Please take a look and see if its doable to add these to a
> driver.

Thanks for the heads up. I've put this on my list of things to look
at. Please remind me if I haven't responded in about a week.

Cheers,

Joel


>
> They are:
>
> * CLEAR_FAULTS - command 0x03
> * Clear logged faults - write 0x00 to register 0xEA
> * STATUS_WORD - 0x79
> * STATUS_VOUT - 0x7A - all pages
> * NUM_PAGES - 0xD6 - though maybe we can get the number of pages another way
> * MFR_STATUS - 0xF3 - page 0 - for reading the GPI bits
>
> Also:
>
> Write, 0xFA 0x08
> Read, 0xFB
> Write, 0xFA 0x09
> Read, 0xFB
> Write, 0xFA 0x0A
> Read, 0xFB
> Write, 0xFA 0x0E
> Read, 0xFB
> Write, 0xFA 0x11
> Read, 0xFB
> Write, 0xFA 0x0B
> Read, 0xFB
>
> I also have a document I will send you offline.
>
