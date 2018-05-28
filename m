Return-Path: <chou.brad@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c05::241; helo=mail-pg0-x241.google.com;
 envelope-from=chou.brad@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EBhKOvRr"; 
 dkim-atps=neutral
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40vXVD38dFzF0n5
 for <openbmc@lists.ozlabs.org>; Mon, 28 May 2018 20:03:00 +1000 (AEST)
Received: by mail-pg0-x241.google.com with SMTP id p9-v6so5081304pgc.9
 for <openbmc@lists.ozlabs.org>; Mon, 28 May 2018 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=hrlv6oaR9YConlrA/5kZvBYq6GGf+VssL1oC6aC5EVE=;
 b=EBhKOvRr6LdmWg8puZ4Jj9MpePB1ewp+YzMqzpb1HAVmThzNr/PuoLH5OUqJpr48j6
 iV18cP0o4/q6OuseulOonxaYMmiSbZneiOvErjGsuHYqTQZ7EzkLJza4RFt9rf0Y4kpa
 N0d9k+1V2DkzGbGKHpPFefaI+KmovuvmnFtpmB3NEOJMzmG1jVggIxIHCBk1swLukAp8
 xD1PQbgiS+9CPed+l3wg7/wErq7Swg9fpzzqoURwYwcbZAEeZX3sGlpSLM2JYMXhQhja
 8OZnF70wzhNORLjX+uv4q2rY5deh76acTE+xWnxsumHrXyheJilMM1yBGC6bUL3/jyrz
 +KWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=hrlv6oaR9YConlrA/5kZvBYq6GGf+VssL1oC6aC5EVE=;
 b=tCldRHBEIkfoMW4R7dC5q2dEbCd96vExdMTVnyDnl0zOru1zZ2YYhX0f9zTDcRGy8W
 PqgH9umWMQTSIouv01JRuSTspt0yXuZSwVjtTeukxVHL4mVLtDCI0I6sF2Xu/SVVK9v8
 jZosOXdgz1YtIVcS6P+vHt2ZXRdGb01O1YsqfAw2+4MiymU4KZCe4m6//T5DdDkSr3ZE
 mJIiWIR5LL3+2y5kRFWJkm5NteAiLYi73W2JCrew1+ySPR0d9OgkImzEPB0ak7tKFgwZ
 lSQz2Cul2LN/PFSAdCRbFO2TpSLmEZDHOov4RCBb8fmLWvgJaYtyCpMV+UNvP4tJzymr
 nwVQ==
X-Gm-Message-State: ALKqPwcQV4xAExbMtWwh4typDygf5cAQnXmqvXCPt0CKdY0z6q2pDCCZ
 G9EsWhuzNEAcxe0pckpBgyRb6tlD
X-Google-Smtp-Source: AB8JxZqLaqp0gtgROgheIXf3LXHe154bg8tHJ/OYlOvQZ81MxthhBV29JRX1OH5nLqP2aLOWJ0QAxQ==
X-Received: by 2002:a63:6f05:: with SMTP id
 k5-v6mr10199225pgc.62.1527501776666; 
 Mon, 28 May 2018 03:02:56 -0700 (PDT)
Received: from [192.168.1.2] (118-163-39-90.HINET-IP.hinet.net.
 [118.163.39.90])
 by smtp.gmail.com with ESMTPSA id g207-v6sm54171622pfb.18.2018.05.28.03.02.55
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 May 2018 03:02:55 -0700 (PDT)
From: Brad Chou <chou.brad@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Subject: Fail to start org.openbmc.managers.System.service
Message-Id: <6A9E4639-55AA-4DE5-B62B-92056DBB2AAD@gmail.com>
Date: Mon, 28 May 2018 18:02:53 +0800
To: openbmc@lists.ozlabs.org
X-Mailer: Apple Mail (2.3445.6.18)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2018 10:03:01 -0000

Hi all,
I have s problem while start the org.openbmc.managers.System.service
The log says it fail to import obmc.inventory
Then every other service that required =
org.openbmc.managers.System.service just forced to be stoped.
Can anyone tell me what the obmc.inventory is ?
How can I fix this problem ?
Thanks.

May 25 11:20:58 system_manager.py[1015]: Traceback (most recent call =
last):
May 25 11:20:58 system_manager.py[1015]:   File =
"/usr/sbin/system_manager.py", line 15, in <module>
May 25 11:20:58 system_manager.py[1015]:     import obmc.inventory
May 25 11:20:58 system_manager.py[1015]: ImportError: No module named =
inventory
May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Main =
process exited, code=3Dexited, status=3D1/FAILURE
May 25 11:20:59 systemd[1]: Failed to start Phoshpor System Manager.
May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Unit =
entered failed state.
May 25 11:20:59 systemd[1]: org.openbmc.managers.System.service: Failed =
with result 'exit-code'.=
