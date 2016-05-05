Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x22e.google.com (mail-oi0-x22e.google.com
 [IPv6:2607:f8b0:4003:c06::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0wlr2x9bzDq62
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 23:31:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=Go9vHfgR; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=XZMzvxYT; 
 dkim-atps=neutral
Received: by mail-oi0-x22e.google.com with SMTP id k142so102233228oib.1
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2016 06:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fQ8vVSv/hObxKlfYP6lXw5qxMp8rDES/vFVn51oMjGg=;
 b=Go9vHfgR2FIpfdnZzEE+n5Bu/xdLY61rTtcLziZv4/Hi1L49F5tdcK57rp3uyycTVa
 oXACZ/sC+yHPq1xpdKxv5g5612aNWFsEESK4BBo4hSpNWw/OdnHC79mazGTgZ8GolRn4
 6yJ+M/YSRsbE17MY8S/WivKxlyfujpQgGtUjNaJNZUYXbhWn5yx98FIupHOhUrF1+dsc
 PKA8vFiNZTm9BewE2BHB5lL9f3RiHzIQBw/z1RVm7FcrOxm6NYCpw4Z9Qn5V5q4lPxdF
 WT/evF2sMFLTZZ9HXAjlbN8pjh7NT0LAR/mzWvi3maTHxzP0GvFOlygkbAF1bX4p/L2Q
 9H5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=fQ8vVSv/hObxKlfYP6lXw5qxMp8rDES/vFVn51oMjGg=;
 b=XZMzvxYTGFkKYCSKWMNjV4rT9mUQ7xk1SmdWfmQsAARIdwMS9dFnCQ002rTQdOlXL2
 NwdrXbeS+osvK3s7xs3XiOTP3khPWnZB2Bbqi1DKEB6vOtUVdYKz3GRbScqsDVY2AL/D
 XmWFbIYyDZ8FaAx57RCBiDKU9CeHhS12q8Lno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=fQ8vVSv/hObxKlfYP6lXw5qxMp8rDES/vFVn51oMjGg=;
 b=c6auw99NBPO+CHmhfvksOZy4dXBIQFEkw6ODed/Cs1GNfXjGPv6GCCZ6zkf6+xBhC9
 d3Z1wLV5Y+ZxNx0ParsMBCIrhDE+FygJ8xmqX7v/1zBG4fAH9ACvGnhcjqMSC/NyaDnO
 2k1I1j46VqBa7XvR4psXNUQ2HqcI2+QopGiu/Bhaer8NZ0g/juRBE+XT/rL8CFNz+wNb
 k8KoXPxpa7NsBYJgTO+lFbBZaJEoQ4rBORdWz5ALCqhdf3iXdbrW/w8uKCyB20QZo+3r
 jpu3KvfBPvF5E1ELsjc2UeJ877Gw88cgqoqTj1dzMhcJdZPHCHp5eahuka45LawjcGNy
 jXhg==
X-Gm-Message-State: AOPr4FXjQgek/gHbSnNTxkYvtPDQXipDYSIO2CcsHp1wLyCfIYOTlSY3vcY2n6vzumTRmDewfg026v+VGG5srA==
X-Received: by 10.157.41.202 with SMTP id g10mr7234797otd.122.1462455062134;
 Thu, 05 May 2016 06:31:02 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.79.200 with HTTP; Thu, 5 May 2016 06:30:42 -0700 (PDT)
In-Reply-To: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 May 2016 23:00:42 +0930
X-Google-Sender-Auth: 9S5Z-13LKXImJFB8S3IUXbn30FQ
Message-ID: <CACPK8XcOshoG8468bs-XN-_488DKcNrh4rtK=LVua8BD7WMuyA@mail.gmail.com>
Subject: Re: [PATCH 0/6] Firestone patches
To: Cyril Bur <cyrilbur@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 05 May 2016 13:31:05 -0000

On Thu, May 5, 2016 at 10:57 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> Did some work getting openbmc running on a Firestone. These should
> also work for a Garrison, the firestone.dts is probably good for that
> too.
>
> Thanks very much to Gavin for getting networking going.
>
> These patches are the outcome based on dev-4.4.

Great work! I've commented on some of the patches, but I'll merge these as-is.

Cheers,

Joel
