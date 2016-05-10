Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com
 [IPv6:2607:f8b0:400e:c00::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r3msT5RyBzDq9s
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2016 14:45:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=nKtjERts; 
 dkim-atps=neutral
Received: by mail-pf0-x235.google.com with SMTP id 77so988584pfv.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2016 21:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Tv7xoRLMP8yIc5Cg8NnTBaBXiRkWS1mbvjZpYNNFq7Y=;
 b=nKtjERtse02I8uG2oEGbdhHSOkRygpUqDAc0bE6rhKUr1bI3xztmNceOPUpLDoOtrM
 7M0ODVcxsARdEvi0JxzaFzZxF4gHo3TBH9iT7/cldXJ1Ko8IHKhsK56oSQNZafaCeMUR
 AMbgH99zIJaUYV7k6WUzl/H5An89Y6q3MU38dcHoOI4kU15kdGyGwa84Z8jidDGuL5lw
 GWXmDwSDyB6OjgarFTWPr1CJ7jhiI3L9Ee4neimAjkOMpqXnN13jjBmXdGKyf09x25F7
 NwvjvXR9y7lstUS2IGe+zniA9LyHsm3kYHa5Rv9axUovk3aEnb/oqdW1Dx2wBRXSO9mC
 IftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tv7xoRLMP8yIc5Cg8NnTBaBXiRkWS1mbvjZpYNNFq7Y=;
 b=SFtK4CH/gZ0N4KpUOgVg1TQ9o7BVhilduobOyA+Tk/Ocr7UxzMP4cs6o9cn3L/aLoQ
 7MVtktSOIeaoaFM39+Rkn4qu2zoKaolvcd5+ojqyiYXbWlH19DMZwz71G2oGn7QFRukt
 n3fBRtnwlFgeu8Kh26KnkG0897ubh9x+smQsaln6iAV6EXCIOJHx+mjWKsaKbiT1exak
 R8cYregOm/+MrU64gbZLCqy8xTaAsWe5wkBSu8BeS1tEp0nWceWq/H9nd5Aa37rjt+OH
 tFhh7iq4vGNjUgp8vcA1TuB3AJ3R8/jPRt1EZPQ+Yfk8xfMm+Xiydo3tcECOHKqwuni3
 FSfQ==
X-Gm-Message-State: AOPr4FX98Dv788pf7PDVj6qR9QIbRYo6AoC78NtLtFPgYYO9T4t+h5bTXcvLuaPvs4B8sQ==
X-Received: by 10.98.64.79 with SMTP id n76mr55704740pfa.149.1462855547662;
 Mon, 09 May 2016 21:45:47 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d186sm467115pfa.45.2016.05.09.21.45.44
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 09 May 2016 21:45:47 -0700 (PDT)
Date: Tue, 10 May 2016 14:45:38 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: Benjamin Herrenschmidt <benh@au1.ibm.com>
Cc: Sertac Cakici <cakici@us.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, benh@ozlabs.au.ibm.com, Gavin Shan
 <gwshan@linux.vnet.ibm.com>, Raguraman Tumaati-Krishnan <ragu@us.ibm.com>
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
Message-ID: <20160510144538.324016c0@camb691>
In-Reply-To: <1462847606.20290.137.camel@au1.ibm.com>
References: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com>
 <20160506113218.4adf5db7@camb691>
 <1462578052.20290.61.camel@au1.ibm.com>
 <201605091951.u49Jp4Yc017604@d03av05.boulder.ibm.com>
 <20160510103800.730f98fa@camb691>
 <1462847606.20290.137.camel@au1.ibm.com>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 10 May 2016 04:45:50 -0000

On Tue, 10 May 2016 12:33:26 +1000
Benjamin Herrenschmidt <benh@au1.ibm.com> wrote:

> On Tue, 2016-05-10 at 10:38 +1000, Cyril Bur wrote:
> > I got access to fr112 and only managed to get tftp booting going on it
> > yesterday, all good though, I've tested what I need. Interestingly on that
> > machine networking behaves as we expected and Gavins workaround isn't needed.
> > 
> > I know this is a long shot but do you know how our firestones in Canberra (which
> > are clearly pre GA) might differ?  
> 
> Cyril, could it just be a different uBoot messing with the pin/strap
> config ?
> 

I can't find any difference between the u-boot config registers on fstn2 and
fr112. Joel did suggest the PHY might have strapping difference but I can't
find anything that suggests it can be changed in software.

I will try putting identical versions of AMI firmware (ours is slightly old),
maybe they updated their u-boot to do something special.

> Ben.
> 
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
