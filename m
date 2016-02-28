Return-Path: <cyrilbur@gmail.com>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A85871A0342
 for <openbmc@lists.ozlabs.org>; Mon, 29 Feb 2016 09:09:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=I/z/20dd; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id y7so7584882paa.0
 for <openbmc@lists.ozlabs.org>; Sun, 28 Feb 2016 14:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ve33kyHGYRyilUP9pwn0bkp2S6KS/lEl1sC0Xjxwk2M=;
 b=I/z/20ddHkLsY028SyslX3Wi1hinWOqaklBWHe7z0hE7lM6VA0EY7u/iJ0nQpAP8Cw
 OcpYo/R9N25GTG61f4EKe1Kn5azR7zWXP/BgSXTn+UtUAs356RJZPoia9zIqbHCnBlSK
 n/WXQiwLUs1aojKliBJcZfdis4lSfg0Ns6nQXdmtPKFyECovIc6W9mUea2kMIpZHVv5U
 s2lzeOhO9oYCFtvBVZt/OaiItMwJoQITTn5Y34M0rTstD18TcymJdfn0Wx9OLGfA0ftm
 bEhjuUwBXuCBomtFKPmFFxOK38wP+S9pMnMTdAUUlcOyjgx+8G+kOuoOMVmTObO5oXPg
 8tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ve33kyHGYRyilUP9pwn0bkp2S6KS/lEl1sC0Xjxwk2M=;
 b=OSgo50+fMsjqu1D88FgLDTibSX2LHGFDbrF6J3bAB2nm+6tQrkOnVdRf1FxKoe9JCY
 GVG4u7G5zdDp4W4XsvYtCOA4zzec/CRMJvCh9SdJDUbWtX2lo/mvx/kaqRE/rhtgwVj5
 p3AnjIMD8w8LAdlSYDo+Im5L1mgFyAO3r9ErLGaKythtl/UrE7CkavzviNw9wE/oCNGm
 cYdd3tgQQDDgUlBFuQmvkS9ei0R3qYRW/CCH38H4PXdlowDY1AZhCReMLEitZwdMt7Yb
 l/xugllPPC7WQfDxZ4WMcZm0ujRwkWZTOuzTbBrhBXd1T8uiq1MwFxYGcrrHJzWfzdtg
 LRgQ==
X-Gm-Message-State: AD7BkJI7eQMpZ4DOaBzAEm+iH3T/kjrF2hWL6yfWz7K1Ww4gUceaIPtdMBL7yi2ywmYmlA==
X-Received: by 10.66.160.7 with SMTP id xg7mr17606390pab.10.1456697341799;
 Sun, 28 Feb 2016 14:09:01 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id ac1sm33152968pad.41.2016.02.28.14.08.59
 (version=TLSv1/SSLv3 cipher=OTHER);
 Sun, 28 Feb 2016 14:09:01 -0800 (PST)
Date: Mon, 29 Feb 2016 09:08:53 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
Message-ID: <20160229090853.3559a7af@camb691>
In-Reply-To: <CACPK8XcNM2j-ehHWC9mF_HXLUeuqc4M2HZxE_=ZXy1OMoEAyfA@mail.gmail.com>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
 <20160226163612.4491a525@camb691>
 <CACPK8XcNM2j-ehHWC9mF_HXLUeuqc4M2HZxE_=ZXy1OMoEAyfA@mail.gmail.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Sun, 28 Feb 2016 22:09:06 -0000

On Fri, 26 Feb 2016 17:09:40 +1030
Joel Stanley <joel@jms.id.au> wrote:

> On Fri, Feb 26, 2016 at 4:06 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > In completely unrelated news is there a way we can fix that pressing reply to
> > all doesn't send any notification to the author of the patch...  
> 
> The best way to fix that is to use git-send-email to send patches to the list.

So that is the preferred workflow? Happy to not do pull req but I've sortof
just gone with the majority.

There's simply no way with stuff coming from GitHub? I find myself misreplying
to a lot of those...

Cyril

> 
> Cheers,
> 
> Joel
