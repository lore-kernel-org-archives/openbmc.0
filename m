Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3syNCn180yzDt3Q
 for <openbmc@lists.ozlabs.org>; Tue, 18 Oct 2016 02:58:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NIJ0OqDb; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id i127so12663557oia.0
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=52hQZIXXCLjm0euf/b+nKciM25ARjduSdacaxbJfu5M=;
 b=NIJ0OqDbUiEiQ19jv3nKfPydJ0XtnIRItNSARA4Fq0UAB9VwPUAINt3VAccCyWeZ1w
 6wdStQt9/ZB8amB48yOtsM6TqfBgfhr9MlT5K4uhlwKCjG/doTAGtf8oVCGVLmgF3NIf
 8AWHlqTxFU0mwP0VScotS5OyKcLTrLUGyfedJm09jTMIhk1xPMQvSs+gARbJKiK4Er4G
 tzzdTgxJaEpVdSnKMYQQUVx8NFVfr4bh9sWztOMSKxTr0HbeQYXtqy2NmAS2HIsBp/Zw
 NvDrWUK1B6G8/bmYHGqtmr8AwQW0BPYPD6dc7dS6QsUQC4veWrwzIi9Tm4DDrGBbG18d
 Y9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=52hQZIXXCLjm0euf/b+nKciM25ARjduSdacaxbJfu5M=;
 b=E+OquxCRYyTT6iGKHeClk+mgK8bHXhVp6NkIsvggrGefK9NEIdlpPtGilC3gVqrnz6
 ll1JgcHqrncpCNh9kxRXJFRu3ztI1czxy/U99V3geToRT07cbi1sKcafMkHKlQb0Use1
 wxgEg7b7LsynavgaESbMA+6TQbYTRkHt1nMNezQW1H3k6tKvA/jA/x91uaNjWjtuJyba
 SZYtXEus7iuu2WeVSTkj/6L57VyLJJJ8u995dnfSYoQEGBbHDZwX8BxohE/52QVXQKGY
 hkcv4/PbsUxnXO3xU+OKt7SkdQKhgQHRR/t1Y3Hs81PTkXd9EZBFGdO+jDuUP84hIPDh
 Dvwg==
X-Gm-Message-State: AA6/9RmenUaX4kS/GnNqJIqS51AUTqVhVKKvY6b3h+W4WXFvK+x7KpOaNEterCRGiQZJVg+48K+IRRg88xSYWg==
X-Received: by 10.202.117.66 with SMTP id q63mr15876897oic.185.1476719907460; 
 Mon, 17 Oct 2016 08:58:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.9 with HTTP; Mon, 17 Oct 2016 08:58:26 -0700 (PDT)
In-Reply-To: <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <57f3f105-2631-2d93-2133-55f8abb31578@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 17 Oct 2016 10:58:26 -0500
Message-ID: <CAA0LjjWOqe7-z=QfUgTGY3zd796taS5H4wHARd6K7=_NEXjYhg@mail.gmail.com>
Subject: Re: [PATCH linux v4 00/20] FSI device driver introduction
To: Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, xxpetri@de.ibm.com,
 zahrens@us.ibm.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Mon, 17 Oct 2016 15:58:29 -0000

On Mon, Oct 17, 2016 at 2:28 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
> Overall, this series is getting to look much better - I'd say we're in
> good shape for upstream submission soon.
>
> I have some further comments on patches, but we should start thinking
> about how we'd like to construct the upstream submission. Here's what
> I'd suggest:
>
>  - I take the corrections that you've made to my series, and integrate
>    them into their relevant original patches, and update the commits to
>    indicate that you've also contributed to these

Hi Jeremy,

Would this mean doing a git commit amend on your patches?

>
>  - I then update my fsi branch on github with the slightly-updated
>    series of 13 base patches.
>
>  - Because it's only a skeleton implementation, I drop the
>    fsi_master_gpio patch from my series, and you squash (my) 13 with
>    (your) 18, which makes a proper master driver. You take authorship of
>    the resulting patch.
>
>  - You pull from my github repo, and rebase your 14-20 on top of that.
>    Some of those will then be no-ops, as the changes will already be in
>    the base series.
>
> How does that sound?

Sounds like a plan -Thanks
Chris

>
> Cheers,
>
>
> Jeremy
