Return-Path: <joel.stan@gmail.com>
Received: from mail-ob0-x241.google.com (mail-ob0-x241.google.com
 [IPv6:2607:f8b0:4003:c01::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2E19E1A0035
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 14:31:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=R4XGiqwn; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=ISukbigF; 
 dkim-atps=neutral
Received: by mail-ob0-x241.google.com with SMTP id u2so2235962obz.3
 for <openbmc@lists.ozlabs.org>; Wed, 24 Feb 2016 19:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=RO27A88MUtqGA4UCuA5yV2UyToayBxWChsO2KhJr+c0=;
 b=R4XGiqwnVRD2SqPG9dfQ5L80por3cuJRAYwWs0Kld32Kn/VdPxJvVOfu9DXYi2oeJG
 P8kEczKn8D1dd0h12o+U2oAdCsYhjCs7VcjJpxkGHPZvnh7868kvMworCG/aPyb2qL5S
 PvcZLnP+Ti+lA4gorMBLw9Yg8dk2hWmfnLaEIUBnXcoTpiA9tjrXXvScGY6C+RH/1PqI
 0i4g815PjZ244CEZCFhAQ6pS+w/siFE9Ma/mZNRywxshbjLRnXLKj5JqFy7u+ro9rMbc
 w1QwZSpBTlt5+Q8qOjGf7fSvBDWDd3Nh0StjBvVFMjLgS5d0rde2mNIr3xQ0mS533rfO
 NfhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=RO27A88MUtqGA4UCuA5yV2UyToayBxWChsO2KhJr+c0=;
 b=ISukbigFGzGc7H/wdMtEv+EDK1MSGNBBNd2JwCeZu/j2q4UpCR6PsTnaPC/7oxz7DL
 1awp7Lnh9dAyYAhfhajLA0gZiEcYGgWwR8SvwhABHivpEdOfM9NQi66MnCmkc3BWs9T+
 P4+0CAP1p4OwpFcm2Wc7fh9s45RKOLyZfjfIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-type;
 bh=RO27A88MUtqGA4UCuA5yV2UyToayBxWChsO2KhJr+c0=;
 b=PwSZ8qTIROhMSNtqh0EHjYAU8JfSbGzynriG6pgcG/zXg4ElDo+WHC2jQW/CHvjKGs
 xP5uztZzptbEIhLucvYv+w0u6yexpimhQTbBjHOY+wPeQupicGWB3e/beZErSfOSZWR8
 1HXOb/vTsTVnpnr2oO9rzQfrWqlFBHAtswgef8ARtnq0oS+bF/tCpo2posgG4VF0uCtH
 0mk36cnmOBGNDVfo5WL+E4aOsHcjMZBrBzcCssq+MG8DrGPQ5gXRLNWoseT3jrAwjE9P
 11jvhI7VYSJ7SInmoE34pMG0hzBnQW4r8ZEK8nTLO4kBOzyYBn/QCmIXeg0cx1Pd3bCR
 CBWg==
X-Gm-Message-State: AG10YOQFQFOQhrVmlLROpLusZQvMNs5oy7pa17HohPOQnxRqyQ5kbQ9VQ9XEPjypbD6XhFsDKf7eNF3TTaOVOQ==
X-Received: by 10.182.92.234 with SMTP id cp10mr35003246obb.79.1456371107765; 
 Wed, 24 Feb 2016 19:31:47 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.121.1 with HTTP; Wed, 24 Feb 2016 19:31:28 -0800 (PST)
In-Reply-To: <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456370426-11311-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1456370426-11311-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 25 Feb 2016 14:01:28 +1030
X-Google-Sender-Auth: rPoGlvXNlunGkEmtlKETi15fabI
Message-ID: <CACPK8Xf2LmYJ+bjd3EY-RRm_VW4mOXhTAYC_aMuf-nnPHQNuog@mail.gmail.com>
Subject: Re: [PATCH linux] net/ncsi: Fix possible deadlock caught with lockdep
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Thu, 25 Feb 2016 03:31:51 -0000

On Thu, Feb 25, 2016 at 1:50 PM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Cyril Bur <cyrilbur@gmail.com>
>

Can we have a commit message describing why, and how?

Cheers,

Joel
