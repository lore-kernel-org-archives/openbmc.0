Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CC0221A1A14
 for <openbmc@lists.ozlabs.org>; Fri, 18 Dec 2015 10:11:26 +1100 (AEDT)
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 17 Dec 2015 16:11:24 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 17 Dec 2015 16:11:23 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id DA11519D8026
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 15:59:27 -0700 (MST)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
 ESMTP id tBHNBN4N18612338
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 16:11:23 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tBHNBMtG016041
 for <openbmc@lists.ozlabs.org>; Thu, 17 Dec 2015 16:11:22 -0700
Received: from birb.localdomain ([9.192.255.109])
 by d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tBHNBLcm015982; Thu, 17 Dec 2015 16:11:21 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id A45A622B7CFE; Fri, 18 Dec 2015 10:11:19 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Peng Fei BG Gou <shgoupf@cn.ibm.com>, Chris Austen <austenc@us.ibm.com>
Cc: openbmc <openbmc@lists.ozlabs.org>,
 OpenBMC Patches <openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH phosphor-host-ipmid v4 2/2] Add get/set ipmid command
 support with correct DBUS property handling.
In-Reply-To: <OF5D51FB6F.D36E69FF-ON48257F1E.001E5AB1-48257F1E.001ED186@cn.ibm.com>
References: <1450315225-22284-3-git-send-email-openbmc-patches@stwcx.xyz>
 <OF21496544.74E17992-ON00257F1E.001742B8-1450325644659@LocalDomain>
 <OF5D51FB6F.D36E69FF-ON48257F1E.001E5AB1-48257F1E.001ED186@cn.ibm.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 18 Dec 2015 10:11:19 +1100
Message-ID: <87io3w657s.fsf@birb.au.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15121723-0009-0000-0000-000010A982FC
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
X-List-Received-Date: Thu, 17 Dec 2015 23:11:27 -0000

Peng Fei BG Gou <shgoupf@cn.ibm.com> writes:
> This commit has patches from a different commit
> As I have mentioned in my previous comments, please ignore this pull
> request and refer to the latest one:
> https://github.com/openbmc/phosphor-host-ipmid/pull/55
>
>
> Id there really a need for uint_to_char like functions?
> I believe so. Believe that is much more convenient for the conversion
> instead of hard coding.
>
>
> Sdbus seems to have a bug (or maybe I don't know how to use it) but unref
> of of a bus doesn't seem to work.  So you should not call sdbus_open   You
> should call the get_sbus (my correct spelling but I'm on a plane) function
> found in the ipmid.c. File
> I tested those codes, they worked fine. Seems you were talking about
> another bug?
>
>
> I've never seen a need to create free desktop functions not sure why they
> are here.   Attaching an object manager is a single function call.  See t=
he
> phosphor-event repository
> Not sure what do you mean by "attaching an object manager". Actually what
> I'm doing is to call object manager and get the connection name with a
> specified object path.
>
> GOU, Peng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.
> OpenPower Team.
>
>
>
> From:	Chris Austen/Austin/IBM
> To:	"OpenBMC Patches" <openbmc-patches@stwcx.xyz>
> Cc:	Peng Fei BG Gou/China/IBM@ibmcn, "openbmc"
>             <openbmc@lists.ozlabs.org>
> Date:	12/17/2015 12:14 PM
> Subject:	Re: [PATCH phosphor-host-ipmid v4 2/2] Add get/set ipmid
>             command support with correct DBUS property handling.
>
>
>
> This commit has patches from a different commit
>
> Id there really a need for uint_to_char like functions?


You should fix your email client, there's a bunch of weird quoting going
on and then to posting without any quoting.
