Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0ZNZ2tq3zDvZh
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:43:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=uiKfdX5U; 
 dkim-atps=neutral
Received: by mail-it0-x241.google.com with SMTP id 66so9525054itl.3
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=mljUmXBnz/NL4yDybcdNl9OxBni9ZBZz++hGNbqnAV0=;
 b=uiKfdX5UthnGIcVi2H3gYLEG4BZCxGgOKXfGPHbnqoTPj3oaFZnqoc8iRvQLaVUEcG
 m9OpTkgcxeKlHTaZOSOSRJhB9+IKuQWydRfD+H2WDJJAQlVgZh8t+SYLueSUHM80ejfV
 2l5NH36112wywoCLvkrXxsPQVwd4B1JtOe8XnSveqoWpGtAThiCle6MesnV2nw3QVCIW
 HPLDF/4/bnZi23Z6gIhpnVn1nVYBFJKuG9UA4xzH24j1SS1p+qkJZA1DbYNr96c/HllT
 eUPMcoH9VfI6ZroOBUC9zV3P9nCHkH0E9izzeJrJQVpucogg+Vg5IS18ChmLZSZgsjuJ
 YZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=mljUmXBnz/NL4yDybcdNl9OxBni9ZBZz++hGNbqnAV0=;
 b=EMdyqDdWtzy7/AnxwTTx08AsLcZh/nVMk5odKkwGc0f0tN+NDn5qmW5+UsHcBSFAT4
 cWSPmFqxTO8esmzv3dJVVEUw7lndQlgXR86RmGdZhFtnBN10tOYGU16zZEjul9O00ZtO
 b6zAzA1EjKEanfsSr8twYqGJBwXuonNG2puFRfToZfHEjee7e11kMNYLpcvV5rwAmBC8
 dzjLfeScXSLpC3KVaXrIez0qzFmQgb9tbPGS55CH3OLaREgrUQSslQFaNzIT3+JC5MKV
 JadyZJ4fql4hmityMpm7yA1w1P0poKoE7eiM89A/NoJKnMxgz2jZ5bfRkjCRn1KYTe1s
 Vw2Q==
X-Gm-Message-State: AA6/9Rkfn4n7R9a7j12ZJED98KF4Kk4YikNc39VzAPobCLxcDVCPvSIBTtaaUyS27ewIR0IqmSHjUVZSauS20A==
X-Received: by 10.202.94.7 with SMTP id s7mr8960357oib.134.1477028620587; Thu,
 20 Oct 2016 22:43:40 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 20 Oct 2016 22:43:20 -0700 (PDT)
In-Reply-To: <CAPH-5w4Z4N+sm_Cy1g5N6pQWOsd5re_gvkvLCRhMsb8-tttUNQ@mail.gmail.com>
References: <1476842308-142217-1-git-send-email-xow@google.com>
 <1476842308-142217-2-git-send-email-xow@google.com>
 <CACPK8XdZY82jsdgghGXD-erP5OhwfSMZqx_aN7tySP7iHRpAMA@mail.gmail.com>
 <CAPH-5w4Z4N+sm_Cy1g5N6pQWOsd5re_gvkvLCRhMsb8-tttUNQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Oct 2016 16:13:20 +1030
X-Google-Sender-Auth: gTtjMajNh6m9U-3g4aM7ISnoyhI
Message-ID: <CACPK8XdJnBfWJerwOGmu8peWUF8P-HrTGKdM-9L_czr7VOOYFw@mail.gmail.com>
Subject: Re: [PATCH linux 2/2] phy/broadcom: Add support for BCM54612E
To: Xo Wang <xow@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Timothy Pearson <tpearson@raptorengineering.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 05:43:43 -0000

On Fri, Oct 21, 2016 at 6:58 AM, Xo Wang <xow@google.com> wrote:
> Hi Joel,
>
> On Tue, Oct 18, 2016 at 8:49 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hello Xo,
>>
>> On Wed, Oct 19, 2016 at 12:28 PM, Xo Wang <xow@google.com> wrote:
>>> This PHY has internal delays enabled after reset. This clears the
>>> internal delay enables unless the interface specifically requests them.
>>
>> This looks fine to me. We have a similar patch for adding the Broadcom
>> phy on some of our machines. I just noticed that isn't present in
>> dev-4.7, as we were sorting out an issue that required us to force the
>> PHY into 100MBit mode. Would the aneg change be related to that?
>
> Exactly, this is just for a different PHY. I'm not sure about the
> BCM54210E part that Firestone uses. The Broadcom docs for our part's
> internal delay says that it increases with decreasing link speed (1.9
> ns, 4 ns, 50
> ns for 1000 M, 100 M, 10 M, respectively) so it broke for me at all speeds.

Ok. I will add it to the backlog to investigate this. Thanks for the
explanation.

>>
>> I suggest you submit these two one upstream. Use
>> scripts/get_maintainer.pl to work out what mailing list to send it to.
>> CC me so I can provide my ack.
>>
>
> Will do, thanks.

I added the patches to dev-4.7 so that you can move forward. I usually
prefer to wait for upstream and backport that version, but I can't see
upstream asking you to make many changes.

Cheers,

Joel
