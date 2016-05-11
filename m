Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4Q6973Q7zDqCK
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 15:44:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=l9WZLHR+; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=DAc3A6Z/; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id t140so2016732oie.0
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 22:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RveU3ecxv5TYoTawxhVa8KucrO8aRCxvYZSwC+Rbze8=;
 b=l9WZLHR+vAyAhm+tqhfmjSf/7UpBtscj0bbrVLIwLXWG/1fpA6gRBSGkmYYesvqenN
 TDsxSJbGyVeqT1zOtjonQHTY18IdxdZggSp3XPBx4eraZMFdzoF1J8+PXoyGqBdmwVq3
 hVXaui1MO/H7lTb/7hMRLhp6adMMYwkCJsD9FINXJliMJZ9q0ItmXYyEopP651CTzwD4
 9R/69h5uuPlRmSPXMiVmcHv10T+oBIj+csRYiMZW9biq7ho043qoRdN5LksXN6YsvqgW
 uKEb97MUJHceKs7JdSrdVgNiEY9N1GyewwRcuzlF0xBALCYPdHPPwXjas7TGOCmqHBBX
 IgSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=RveU3ecxv5TYoTawxhVa8KucrO8aRCxvYZSwC+Rbze8=;
 b=DAc3A6Z/kDJJ4zcUWl5Vqk6XcDmlgy6ElwC72DAcO57lfVqyA78L0DbqLgRuMVSXq0
 rf45szb2pR/tw8XjFjLmQjdTNVFxF77s23hQhxFtDLeAQTwhvwxDeBMZlggySkpIvJwl
 PS7yZbGEBqmc98EK855a/uqfubQUTucZdRt1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=RveU3ecxv5TYoTawxhVa8KucrO8aRCxvYZSwC+Rbze8=;
 b=PgSvids+TtCv08NVrNfzr1Ktp9Tiq7worSlCnkjbEnfxUYgBBHzkbeM/v3DJwKF/6s
 fOYpOLwAscGq7G+kv/W/Qg8kpjmxwcGs+TRVVBZNgsord7dWx3SkSnxD94WYTjeUXRim
 IqeG+D9ZsJGjCr98SBQ30U/z95dj/FScApsqZCNws1WCWa5MKFyQfj2IZOw53SciiBXK
 UfK3owyXeGss2cAbCywHG35MlkEeGtC6Erze9djBHriPp2rsetjQ71bybQu+Cgbt+z+6
 rCCK9WjrkAkFFncNKbpkUZ1srcj/Psa2SRIl3Zbin3xGXqdX0gNhacRJuQgY86pX6BzL
 ZzHA==
X-Gm-Message-State: AOPr4FXtjb4SwrMokdSEwHBEDiVBzOKHK8DIYETUFvVE/J6cLJlzwS3a5vt1gLqmuITLj+G44681BGZ6SrKQJA==
X-Received: by 10.157.38.182 with SMTP id l51mr828486otb.113.1462945439532;
 Tue, 10 May 2016 22:43:59 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.3.102 with HTTP; Tue, 10 May 2016 22:43:40 -0700 (PDT)
In-Reply-To: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
References: <1462758439-27910-1-git-send-email-gwshan@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2016 15:13:40 +0930
X-Google-Sender-Auth: 9mtA-fMVFoqrJXRCxOUnxJgo1WE
Message-ID: <CACPK8Xf3-THRo2bj-+kd8-oU-qqwt=TR=KSV_sdoDj1t7ZPb_A@mail.gmail.com>
Subject: Re: [PATCH 0/8] NSCI Improvement
To: Gavin Shan <gwshan@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 11 May 2016 05:44:02 -0000

On Mon, May 9, 2016 at 11:17 AM, Gavin Shan <gwshan@linux.vnet.ibm.com> wrote:
> This series bases on branch dev-4.4. Couple of things are improved as below:
>
>    * Remove netlink stuff as nobody starts to use it. Lets focus on the core
>      for now.
>    * The available packages and channels are enumerated for once when user
>      brings up the network interface for the first time. Afterwords, less
>      time (3 to 4 seconds) are reduced to bring up the interface.
>    * Explicitly enable AEN that is disabled by default.
>    * The LSC (Link Status Change) AEN handler helps switching active channel
>      properly after the packet can be received without problem. In order to
>      listen for ingress AEN packet, the MAC has to be ready for reception
>      after the interface is brought up.
>
> This series is to fix the bug: https://github.com/openbmc/linux/issues/61
> With this series applied (based on dev-4.4), it should fix the issue. Note
> that I had the test on palm4-bmc.
>
>    * From uboot, download the kernel image;
>    * Unplug the ethernet cable;
>    * From uboot, boot the kernel image;
>    * Configure the ethernet interface when the kernel boots up completely.
>      The NCSI interface should be down;
>    * Plug the cable, the NCSI interface is up automatically. The interface
>      is pingable from external.

Great work Gavin. Thanks for getting to the bottom of this and testing
the patches.

I've applied them to dev-4.4 and tagged a release that includes your changes:

 https://github.com/openbmc/linux/releases/tag/openbmc-20160511-1

Cheers,

Joel
