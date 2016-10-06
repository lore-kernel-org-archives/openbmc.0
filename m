Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqhYs4vrkzDrSF
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 05:50:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=l5n7MUj4; 
 dkim-atps=neutral
Received: by mail-oi0-x244.google.com with SMTP id i127so171829oia.0
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 11:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=zN6QJtUGy1MFPc8a/UeCd5+1cIvu3NZp/xzKjdPiVAg=;
 b=l5n7MUj4+9LEA9z1T/VfcJxFtk46dhzO14gTw4xVYTPbg/hvJyorvKq95ojY+XVCKm
 6bsi+bFonTN79AyJrW+xanjf+wMhyV4otqhTGCJTgdKLYIpZieLU468t4fU9SCJJjdCo
 24gs4u5rEOsHnlmueA1BhQYtmV2x4CbEGDE0zPtCq2pCXRz1MrwwCFhumVqpE2XAAmTM
 QkvDPzqNK8W9DwfqvleexO7swn2XJKR1d/f9FjH+OhoEYiQBHIiGRtkBzQ/Cm/eOW1GI
 ROOStLjeCFu19dXbvAjrrj+74LnPD4VfdIw+g9WVECDZyWEY5D5uUUp+RyAB56FC/MAE
 /HTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=zN6QJtUGy1MFPc8a/UeCd5+1cIvu3NZp/xzKjdPiVAg=;
 b=XCYAasRP6nkilZX5Eq4jTTQuJWhnKysIGAGyvdODiT/JKj4BO0S0qHvdVTN14MkuLu
 zaENr9fhsiY/kRWa09BB1w60+OdDdiSQ36LQ04Wpqhuh7ulki+pGTFrFO5LIJuGcvVq6
 SN6yYKj7FY13F0HFcf8ilmqz7n1/LhqWaoq3SS5ytq/cbZYuIKr/a5qGFm1mPLJT3veE
 1BdaX8PO7olHQ/1/o5hJ/Af/X8KyDXiZkNFzq4W0TCTAypsRxWV2TmeAPFUV5YoFG9qQ
 IAKhVtH9AMOLWAXhdZRkmv+clzfach31N5kMMGmpMA5an1o0dhtUQXH6lcsgQ09e/COP
 JE6A==
X-Gm-Message-State: AA6/9RnI/8J8SfvSmD25Ie4Wu83F0tp3LPAsidjWuoyyEQ7HrAOZDAMZaracJaB9B8NmKg9gp9E1KkeFUo3vIw==
X-Received: by 10.157.35.247 with SMTP id t110mr10508960otb.134.1475779855937; 
 Thu, 06 Oct 2016 11:50:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.220.132 with HTTP; Thu, 6 Oct 2016 11:50:55 -0700 (PDT)
In-Reply-To: <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-15-git-send-email-christopher.lee.bostic@gmail.com>
 <6e8e9ea9-b728-8deb-8859-73904682b7cd@ozlabs.org>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Thu, 6 Oct 2016 13:50:55 -0500
Message-ID: <CAA0LjjXW-h4UXA2OAEVx=5w38z+n_4NmAQQQLP1qj+VuSUt_fA@mail.gmail.com>
Subject: Re: [PATCH linux 14/15] drivers/fsi: Rename slave to cfam
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
X-List-Received-Date: Thu, 06 Oct 2016 18:50:58 -0000

On Thu, Oct 6, 2016 at 1:58 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
> Hi Chris,
>
>> Suggested changes to the patch set so far as provided by Jeremy Kerr.
>> Rename slave to cfam to distinguish between the slave engine and its
>> containing cfam.
>
> I'm still not 100% on that. As is my understanding, a (hardware) CFAM
> contains multiple slaves, and that not what `struct fsi_slave`
> represents (it's a single slave).

One other thing that would make a cfam struct that is separate from the
slave engine useful is the fact that there are several different hardware
quirks for which the only way for firmware to know what to do is to check
the cfam type.

P8, P9, zNEW cfam types

* Controlling master's MATRB bit encoding is different versus other cfams.
This is not a function of the master type, only cfam type.

   I'd propose something like:



   uint32_t cfam->decode_matrb(master->matrb)   possibly.

* Any master that has cascaded masters downstream must set its
MSIEP registers differently than if there was no cascaded master.
This is to work around a known hardware bug in interrupt signaling.
The only way to determine this is to see if downstream cfam is a type
that has a cascaded master.  Again independent of a controlling
master's type.

   bool cfam->has_cascaded_master(master->cfam);

Several cfam engine device drivers have to work around known
hardware bugs on specific hardware.  There are cases where
the same hardware engine (id and version same) behaves differently
on two different cfam types:

* IOU mailbox engine has same engine id, version number but
has different behavior on a CFAM-S type versus an IOU type.
This would require some form of fsi client query of cfam type
or initialization of some op.

* The P9 iic boe engine did not have its version ID incremented
from P8 even though there are differences in the command
register set.  There is no way for the iic driver to know which
engine its on unless it knows the cfam type.

The IMD iic engine with the same engine ID and version will
have differences in iic clocks due to differences in cfam
type.  The iic bus clock is derived from the parent fsi master
clock which is divided down differently on different cfam types.
In order for iic driver to know what frequency its buses are
operating at has to know the cfam type.







>
>
> Jeremy
