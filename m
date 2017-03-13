Return-Path: <geissonator@gmail.com>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vhrDz6f2dzDqXf
 for <openbmc@lists.ozlabs.org>; Tue, 14 Mar 2017 08:13:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TQWsUdyy"; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id l7so92568053ioe.3
 for <openbmc@lists.ozlabs.org>; Mon, 13 Mar 2017 14:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2/H0ZMw59e1n9VDuXAx658b7G3RJL0EViXVq9RVLtrk=;
 b=TQWsUdyyPWpZ2zv+bEAAR0mKCxMlUJFSCM3c975IkW66xDgcDg0BIkwWGNeAg+T5U1
 nvgjPGlC5lgyVIlG4BKaWK5dTb4dRtcsxoS7tYu/lJiQ2gERuTLcTaYvNUl8Hw+VoguI
 /hSvCDYrdcLjLHS6ewC8ELJXyH0N9LAnrdPg+rWNcvK3UO4kAD1z/+yVjJzjxvFspfAr
 ANSccsa365hcZ0usCZ1pmJS61L10UgF0s6f9Et8DObdEalB42MylG/42ypmvDXhAHWJU
 BcpyyXOQ4qFXJQ7VqnOLrviq4cGE/zQPdx2h4xM5h/rPI2mplwHpJ9O/Re9oOGTFU3OV
 33Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2/H0ZMw59e1n9VDuXAx658b7G3RJL0EViXVq9RVLtrk=;
 b=IfMu/bFpN7mWqEIn65sFF7ZLkgEIr6FazWRBXcghNBRwV9fD2QwtJLWrnHwPEYE9rC
 ZxioMcAZjaFBn1VrWWF0W0FF6Ybr29GgPNIQImOJlUeWDIP8cpnFCX8ByayxkepVSRf2
 WrO3S86Lif23+m76bPcOB4LWZoiHBJRtccvCxeMFbVpydrUh6TFP/dSSDf/M8BWLRa+4
 /rWo7UEO90eiNkG2nk5nG9etACZ6KI3rGvKRWCHrr4vGYuJhVGlXYtiwCFR7SZxz1fwZ
 nvtaa6NgaIPwhn/oi6DbmYy3IN9MEgXrnZ2y0v1tenvTaag8kvFYLU8toRVBKdF8rdkp
 2f9Q==
X-Gm-Message-State: AFeK/H1orfX4Wq2X8YSRac85g9mqsxHrwamQOpulkH2mhn2U6RkMa6+Box6fQixBp5fuyo1Lh4ZulwWo7MRijw==
X-Received: by 10.107.171.135 with SMTP id u129mr1336443ioe.102.1489439584949; 
 Mon, 13 Mar 2017 14:13:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.53.91 with HTTP; Mon, 13 Mar 2017 14:13:04 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Date: Mon, 13 Mar 2017 16:13:04 -0500
Message-ID: <CALLMt=rCfv4pLqKr+bgh-6HF3OTSP8qyM9XKVOsEG0yCmBhffA@mail.gmail.com>
Subject: determining host state after a bmc reset
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 13 Mar 2017 21:13:08 -0000

Any thoughts out there on a good way to determine if the host is up
and in a good state after a BMC reset?  This of course is without
persisting anything into the filesystem about the host state, I'd like
to just discover it.

I'm currently going down a path where I'm going to first look at
pgood, and if it's on, I'll use the SMS attention path to 'ping' the
host and verify it's running.

I'll need to fix up the SMS attention path (currently openbmc hard
codes the SMS attention and response to the host to tell it to do a
soft power off).  I'll change things around a bit to do the SMS, and
then when the host responds, to do nothing except mark a ticky that
says it responded.

Andrew
