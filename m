Return-Path: <brendanhiggins@google.com>
Received: from mail-pg0-x232.google.com (mail-pg0-x232.google.com
 [IPv6:2607:f8b0:400e:c05::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wv8wr4Mm1zDqjC
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jun 2017 17:20:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="B6kqypK3"; 
 dkim-atps=neutral
Received: by mail-pg0-x232.google.com with SMTP id u62so18034934pgb.3
 for <openbmc@lists.ozlabs.org>; Fri, 23 Jun 2017 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:to:cc:from:subject:in-reply-to;
 bh=xJ5uTMXGr4lBs8SVRWH+3RBKo5Da9HJ1yk3VeihkIeU=;
 b=B6kqypK3RPLsmapvuJbPHXyW7ih3w92lMihU0l9j4TRoiF34gjM55nYiowQ9EMPG+L
 r6zHKtGEBayAAAs2LRjWlqMIz4fZzqjXSobzF6qz5fklx3qSRbmUeixg4xXOKYzmvl94
 ZEUkkOjON8XDE5DaqsF/ey7T1x7ZYs5+PX4aufW2FHQh7hxwfg8aczjByRWLZ20P4INU
 Y5ZhXGa0sNyqVd8RXyLDENKQ2l+HjJ9r54AkjXoQoAf4aiKNwM/jcIntKLDlllq8y12L
 knCqrJ7kogPmD60spTIBXCoYF6Gzxfm/yJyZKFKQLTzaTdXUTjg37rF6lDgn5IhsXyr6
 v3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:to:cc:from:subject:in-reply-to;
 bh=xJ5uTMXGr4lBs8SVRWH+3RBKo5Da9HJ1yk3VeihkIeU=;
 b=fgZGRyHGlw5gv3ipt1kAkhlnIlFsLWNnUj+aeedoznyDqGNEXzYDhGr/kurDIzV5A8
 7EXM61zoSKO+9lohasXH27HF2tziOcaFbQXEZQo1pVn+yQqEDEGTdPye4Ds2iD00LxAj
 nna9F7Hv/kU39AGNrCkT+OvLA/65vw8GXd+O++zRxwpWMVIvCuSGABw5YfWyyRqDLyks
 336NBOeIoBvqT29oBqLshz9SKk9vFRNkbZcl+saETilVWac/WuBzCC9bftBRXiIScym7
 AYJPb4KdI7JwEcD1VRNcqYsA+VySofbGrzfCx9f3qdn8Ei2OCEqnMzqZsw7JCgm7ZTcL
 pdOw==
X-Gm-Message-State: AKS2vOxXw7o+oImiv5GvRZ/QYm4m1/xd52OKs+aavknlANj1g3OIb4HL
 LodDyyQNvnPIzw33
X-Received: by 10.98.58.78 with SMTP id h75mr6582256pfa.50.1498202409556;
 Fri, 23 Jun 2017 00:20:09 -0700 (PDT)
Received: from mactruck.svl.corp.google.com
 ([2620:15c:2c5:3:d0f1:277f:274f:e602])
 by smtp.gmail.com with ESMTPSA id h71sm8475783pfk.126.2017.06.23.00.20.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Jun 2017 00:20:08 -0700 (PDT)
Received: from mactruck.svl.corp.google.com (localhost [127.0.0.1])
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP
 id v5N7K7xY030030; Fri, 23 Jun 2017 00:20:07 -0700
Received: (from brendanhiggins@localhost)
 by mactruck.svl.corp.google.com (8.14.4/8.14.4/Submit) id v5N7K755030029;
 Fri, 23 Jun 2017 00:20:07 -0700
Date: Fri, 23 Jun 2017 00:20:07 -0700
Message-Id: <201706230720.v5N7K755030029@mactruck.svl.corp.google.com>
To: ilya@yadro.com
Cc: patrick@stwcx.xyz, tomjoseph@in.ibm.com, openbmc@lists.ozlabs.org
From: brendanhiggins@google.com
Subject: Re: phosphor-net-ipmid
In-Reply-To: 20170619144445.xpoo5x2sbt3ct22p@yadro.com
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
X-List-Received-Date: Fri, 23 Jun 2017 07:20:13 -0000

> Hello,
> we would like to help with phosphor-net-ipmid and have volunteer. For us main
> priorities are sensors and sel. Obviously work is in progress there and we don't
> want to duplicate it, so please share tasks with us and tell how we can
> contribute?
> Thanks!

Awesome! Always great to see more people getting involved!

The first thing to do would be to hop on the IRC channel: #openbmc on
freenode.net and say hi to everyone.

Next, in order to see what tasks we have going on, install Zenhub:
https://www.zenhub.com/. Then look at https://github.com/openbmc/openbmc#boards

Probably also a good idea to talk to Patrick and Tom (I CC'ed them). I am pretty
sure they are more familiar with that codebase than anyone else.

Once you know what you want to work on, or even if you just need some help,
either start a conversation on the IRC channel or send an email to the list.

phosphor-net-ipmid is not something I work on or am likely to work on in the
near future, but I think I know most of the people on the list, so feel free to
CC me on future emails and I will try to make sure the right people are involved
in the conversation.

Cheers!
