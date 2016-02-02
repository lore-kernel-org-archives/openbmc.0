Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x244.google.com (mail-ob0-x244.google.com
 [IPv6:2607:f8b0:4003:c01::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 105371A0070
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 13:33:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=E1hh4SgD; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=kF4xd0lZ; 
 dkim-atps=neutral
Received: by mail-ob0-x244.google.com with SMTP id wg8so9270854obc.3
 for <openbmc@lists.ozlabs.org>; Mon, 01 Feb 2016 18:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=TlnVRPO7qRSXBTm+n03dTMCyqewS8NpEjD/vl1+OQHM=;
 b=E1hh4SgDFVtd9F7yJQF35LLcLAXHCk7h5qWw6C5kINhVzAWXHpbqR6gG72a5X1Cxgh
 bqewHfTdm+g6fNQagIhkqf0uf3v6azM0tB3o15DY7ulehNLUeBaXECFyN00NJpkWt3Dw
 edLO0MUsqaf5Zfa3kcs6BESMJgwre740lklyp2AQgzmtZqGtC7YAdA9lr8rOS4V0SwMV
 qQ9Q2m4Zpw+caJcmJgG69OCKsPWVLI3/5WXET4wi9UAwdH+ZQ+KbkE4GPYUvQYdWsjrS
 b38+JbHAF7diYiPj3CzqPj2krAsHMZPxeFzfzw2vqH8B9NDVWn1UkHDdCaAQ58WuPGrD
 MeOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=TlnVRPO7qRSXBTm+n03dTMCyqewS8NpEjD/vl1+OQHM=;
 b=kF4xd0lZwPn13RDilg492cR9mPdDeWDjDUMVaxhkdfJuWolfmAkcN1D4/iRcLDkAD0
 A/Z4yaP0NV/ohXjK+VJMI91fDMNdyb8yOolydTXzagRYkiIJ65u42zeSrIrfmCp+8qwY
 /VYl5c+p6sTkNE266/4qTkCnApHH+U8GDOcBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=TlnVRPO7qRSXBTm+n03dTMCyqewS8NpEjD/vl1+OQHM=;
 b=C/nG4UIXkFd7BhXBpHU6LW3NCkMYrNqLXqYGvWXKmGom0/wXZt8dM8aUwatnQzJCXA
 kgqe/uMaVGi5PizRHKwSZjJLQUxj8PnfEOD2jlS5tsRJJlwBJXPMaQo8HHQSDpEbwkif
 lOH+MQLryBAbmQkR0SThXrKq6P2UkClgYK7QKUrHdkUvJHmP8AKXsSs8pv2MRaGvVhpL
 UNTjxniM2GIakKzoFNBcUmrSSQuC9Kjw/AGm1K67tdl9xy37Q3pYzA7DL6SIL6MpAKXw
 NKca4Xk1J7VOQtmenuQwruwUy2jG7hzIBFSx2YLWuHxTU248yhRsO/91M2GJix4vUXl+
 fXWQ==
X-Gm-Message-State: AG10YORzaX3+/9jTaQPrJzHVh8HPC3vW72BZu52XAy5UR88eMTzAQ7g55KsxxDb/gaLqG6Z+Kz6WlxRu+8zQAA==
X-Received: by 10.182.65.138 with SMTP id x10mr20719236obs.39.1454380421108;
 Mon, 01 Feb 2016 18:33:41 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Mon, 1 Feb 2016 18:33:21 -0800 (PST)
In-Reply-To: <201602020225.u122PS5J020332@d03av03.boulder.ibm.com>
References: <1454371229-4435-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454371229-4435-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XcEhamUF3vC2cgb-a4Kwi2DGpn5FZVpcnM-GN7i3Gd-XQ@mail.gmail.com>
 <201602020225.u122PS5J020332@d03av03.boulder.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 2 Feb 2016 13:03:21 +1030
X-Google-Sender-Auth: SHQAukQH9TZx-H-FGv_pYap1aig
Message-ID: <CACPK8XdAPN6aoq5UQgdaw+XYCYiwmD2R5Mwde4aLPjQTBJ=DqA@mail.gmail.com>
Subject: Re: [PATCH openbmc] Update recipes to pick changes for Foxconn build
To: Norman James <njames@us.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Stewart Smith <stewart@linux.vnet.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Tue, 02 Feb 2016 02:33:43 -0000

On Tue, Feb 2, 2016 at 12:55 PM, Norman James <njames@us.ibm.com> wrote:
>
> When are you doing a release? OCC is broken in current kernel release.

Thank you for reporting this. I wasn't aware of any breakage until I
saw this pull request.

No one had requested a new release, so I had no plans to make one.

I will do a release now if you need one with this fix.

Regards,

Joel
