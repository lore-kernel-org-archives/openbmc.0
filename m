Return-Path: <stewart@linux.vnet.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DE781A004B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 10:12:12 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 11 Feb 2016 16:12:10 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 16:12:09 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: stewart@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 3396519D8047
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 16:00:07 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1BNC8Nv28246236
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 16:12:08 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1BNC8Hq001220
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 16:12:08 -0700
Received: from birb.localdomain ([9.83.0.6])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with SMTP id
 u1BNBwpG000390; Thu, 11 Feb 2016 16:12:07 -0700
Received: by birb.localdomain (Postfix, from userid 1000)
 id 6F61A2286E20; Fri, 12 Feb 2016 10:11:55 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-networkd] Validating user & group names prior to
 system call and wait() on proc spawned with pexpect.
In-Reply-To: <754A40FE-3C77-4D68-B0CF-D6877D306613@fuzziesquirrel.com>
References: <1455224447-11108-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455224447-11108-2-git-send-email-openbmc-patches@stwcx.xyz>
 <87egcioppp.fsf@linux.vnet.ibm.com>
 <754A40FE-3C77-4D68-B0CF-D6877D306613@fuzziesquirrel.com>
User-Agent: Notmuch/0.21+24~gbceb651 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-redhat-linux-gnu)
Date: Fri, 12 Feb 2016 10:11:55 +1100
Message-ID: <878u2qon9g.fsf@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021123-0017-0000-0000-0000120CDDF9
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
X-List-Received-Date: Thu, 11 Feb 2016 23:12:12 -0000

Brad Bishop <bradleyb@fuzziesquirrel.com> writes:
> Sorry about the dup Stewart=E2=80=A6

(np)

> grp just parses the file and returns a dictionary.  It doesn=E2=80=99t do=
 anything mutable.
>
> The only thing I could find was libuser=E2=80=A6.

Ahh... okay, I wasn't looking toooo closely.

Possibly worth bringing in libuser? Maybe in the near future at least
rather than immediately.

--=20
Stewart Smith
OPAL Architect, IBM.
