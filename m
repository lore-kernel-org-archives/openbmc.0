Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 25C161A1A14
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 13:51:49 +1100 (AEDT)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Fri, 18 Dec 2015 12:51:46 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 18 Dec 2015 12:51:44 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay06.au.ibm.com (d23relay06.au.ibm.com [9.185.63.219])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 1B3E42BB003F
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 13:51:40 +1100 (EST)
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tBI2pNkZ31785142
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 13:51:31 +1100
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBI2p7Kw009758
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 13:51:07 +1100
Received: from d23ml032.cn.ibm.com (d23ml032.cn.ibm.com [9.119.32.232])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBI2p5c9009048; Fri, 18 Dec 2015 13:51:07 +1100
In-Reply-To: <87lh8s66bq.fsf@birb.au.ibm.com>
References: <1450315225-22284-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1450315225-22284-3-git-send-email-openbmc-patches@stwcx.xyz>
 <87lh8s66bq.fsf@birb.au.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v4 2/2] Add get/set ipmid command
 support with correct DBUS property handling.
X-KeepSent: 6ACC9A26:942A800C-48257F1F:000F8E4F;
 type=4; name=$KeepSent
To: Stewart Smith <stewart@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org, OpenBMC Patches <openbmc-patches@stwcx.xyz>
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
Message-ID: <OF6ACC9A26.942A800C-ON48257F1F.000F8E4F-48257F1F.000FA8D0@cn.ibm.com>
From: Peng Fei BG Gou <shgoupf@cn.ibm.com>
Date: Fri, 18 Dec 2015 10:51:02 +0800
X-MIMETrack: Serialize by Router on d23ml032/23/M/IBM(Release 9.0.1FP4HF72 |
 July 7, 2015) at 12/18/2015 10:51:06
MIME-Version: 1.0
Content-type: multipart/alternative; 
 Boundary="0__=C7BBF58CDF9C08DF8f9e8a93df938690918cC7BBF58CDF9C08DF"
Content-Disposition: inline
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121802-0025-0000-0000-0000029C7CDB
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
X-List-Received-Date: Fri, 18 Dec 2015 02:51:49 -0000

--0__=C7BBF58CDF9C08DF8f9e8a93df938690918cC7BBF58CDF9C08DF
Content-type: text/plain; charset=GB2312
Content-transfer-encoding: base64


VGhhbmtzIGZvciByZW1pbmRpbmcgdGhhdCBjbGliIHNob3VsZCBiZSB1c2VkIGZvciBpbnQvc3Ry
aW5nIGNvbnZlcnNpb24uDQoNCkkgaGF2ZSB1cGRhdGVkIG15IGNvbW1pdCBieSB1c2luZyBzc2Nh
bmYvc3ByaW50ZiB0byBkbyB0aGlzLg0KDQpHT1UsIFBlbmcgRmVpICi5tsX0t8kpLCBQaC5ELg0K
T3BlblBvd2VyIFRlYW0u

--0__=C7BBF58CDF9C08DF8f9e8a93df938690918cC7BBF58CDF9C08DF
Content-type: text/html; charset=GB2312
Content-Disposition: inline
Content-transfer-encoding: base64

PGh0bWw+PGJvZHk+DQo8cD48Zm9udCBzaXplPSIyIiBmYWNlPSJzYW5zLXNlcmlmIj5UaGFua3Mg
Zm9yIHJlbWluZGluZyB0aGF0IGNsaWIgc2hvdWxkIGJlIHVzZWQgZm9yIGludC9zdHJpbmcgY29u
dmVyc2lvbi48L2ZvbnQ+PGJyPg0KPGJyPg0KPGZvbnQgc2l6ZT0iMiIgZmFjZT0ic2Fucy1zZXJp
ZiI+SSBoYXZlIHVwZGF0ZWQgbXkgY29tbWl0IGJ5IHVzaW5nIHNzY2FuZi9zcHJpbnRmIHRvIGRv
IHRoaXMuPC9mb250Pjxicj4NCjxicj4NCjxmb250IHNpemU9IjIiIGZhY2U9InNhbnMtc2VyaWYi
PkdPVSwgUGVuZyBGZWkgKLm2xfS3ySksIFBoLkQuPGJyPg0KT3BlblBvd2VyIFRlYW0uPC9mb250
PjwvYm9keT48L2h0bWw+

--0__=C7BBF58CDF9C08DF8f9e8a93df938690918cC7BBF58CDF9C08DF--
