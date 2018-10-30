Return-Path: <Justin.Lee1@dell.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=dell.com
 (client-ip=68.232.153.96; helo=esa7.dell-outbound.iphmx.com;
 envelope-from=justin.lee1@dell.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=Dell.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=dell.com header.i=@dell.com header.b="Ne4r+BlV"; 
 dkim-atps=neutral
Received: from esa7.dell-outbound.iphmx.com (esa7.dell-outbound.iphmx.com
 [68.232.153.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42l4Kz4s0KzDrNT
 for <openbmc@lists.ozlabs.org>; Wed, 31 Oct 2018 08:27:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=dell.com; i=@dell.com; q=dns/txt; s=smtpout;
 t=1540934774; x=1572470774;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=00MlkvZgvcXpcnkBOzvgHGLprHdObT8/zYwhl+KmqNc=;
 b=Ne4r+BlV5nfk+JSkVLhQ72MDKZ3tXAZPUp+XX/5+8KdSMBZUMYgoO8v/
 9XXKziX3ahfPiWIM5hTZJI6kKJ1UWsTW/s5g3hbCQUzugOCAld195SceQ
 BqZG7T9TUxfMp+ycJVqLGjpye2MroV1x7ku4TGbZeV+PbNHd4HaFrYNB4 4=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2FNAAC+y9hbhyeV50NkHAEBAQQBAQc?=
 =?us-ascii?q?EAQGBVAQBAQsBgVWCFDKMY6R7gWYLAQGEbAKDJSI3Cg0BAwEBAgEBAgEBAhA?=
 =?us-ascii?q?BAQEKCwkIKS+CNiKCZAIBAxIVEy0SEAIBCDYQVwIEAQ0NGoJ/ggKdaAKBEIl?=
 =?us-ascii?q?YAQEBgWgziimLZ4IXgRGDEoRnhXICgSoBhzCGC49YVAYBAo0mg1oggXWOVCy?=
 =?us-ascii?q?WVQIEAgQFAhSBWYF4cIFugU+CJQ4JjhqMEIEfAQE?=
X-IPAS-Result: =?us-ascii?q?A2FNAAC+y9hbhyeV50NkHAEBAQQBAQcEAQGBVAQBAQsBg?=
 =?us-ascii?q?VWCFDKMY6R7gWYLAQGEbAKDJSI3Cg0BAwEBAgEBAgEBAhABAQEKCwkIKS+CN?=
 =?us-ascii?q?iKCZAIBAxIVEy0SEAIBCDYQVwIEAQ0NGoJ/ggKdaAKBEIlYAQEBgWgziimLZ?=
 =?us-ascii?q?4IXgRGDEoRnhXICgSoBhzCGC49YVAYBAo0mg1oggXWOVCyWVQIEAgQFAhSBW?=
 =?us-ascii?q?YF4cIFugU+CJQ4JjhqMEIEfAQE?=
Received: from mx0a-00154901.pphosted.com ([67.231.149.39])
 by esa7.dell-outbound.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Oct 2018 16:26:11 -0500
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
 by mx0b-00154901.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9ULNiCe106941
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 17:27:00 -0400
Received: from esa2.dell-outbound2.iphmx.com (esa2.dell-outbound2.iphmx.com
 [68.232.153.202])
 by mx0b-00154901.pphosted.com with ESMTP id 2nexh1r7fe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 30 Oct 2018 17:27:00 -0400
From: <Justin.Lee1@Dell.com>
Received: from ausc60pc101.us.dell.com ([143.166.85.206])
 by esa2.dell-outbound2.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA256;
 31 Oct 2018 03:26:55 +0600
X-LoopCount0: from 10.166.135.91
X-IronPort-AV: E=Sophos;i="5.54,446,1534827600"; d="scan'208";a="1319704866"
To: <sam@mendozajonas.com>, <netdev@vger.kernel.org>
CC: <davem@davemloft.net>, <linux-kernel@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH net-next 5/6] net/ncsi: Reset channel state in
 ncsi_start_dev()
Thread-Topic: [PATCH net-next 5/6] net/ncsi: Reset channel state in
 ncsi_start_dev()
Thread-Index: AQHUZpcV/jLZttPJVESchUXzrlpHT6U4CxHw
Date: Tue, 30 Oct 2018 21:26:57 +0000
Message-ID: <96158616f0774e3d9fae0e99bb16e605@AUSX13MPS306.AMER.DELL.COM>
References: <20181018035917.19413-1-sam@mendozajonas.com>
 <20181018035917.19413-6-sam@mendozajonas.com>
In-Reply-To: <20181018035917.19413-6-sam@mendozajonas.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.143.18.86]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-30_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=844 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810300178
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 21:27:05 -0000

> +int ncsi_reset_dev(struct ncsi_dev *nd)
> +{
> +	struct ncsi_dev_priv *ndp =3D TO_NCSI_DEV_PRIV(nd);
> +	struct ncsi_channel *nc, *active;
> +	struct ncsi_package *np;
> +	unsigned long flags;
> +	bool enabled;
> +	int state;
> +
> +	active =3D NULL;
> +	NCSI_FOR_EACH_PACKAGE(ndp, np) {
> +		NCSI_FOR_EACH_CHANNEL(np, nc) {
> +			spin_lock_irqsave(&nc->lock, flags);
> +			enabled =3D nc->monitor.enabled;
> +			state =3D nc->state;
> +			spin_unlock_irqrestore(&nc->lock, flags);
> +
> +			if (enabled)
> +				ncsi_stop_channel_monitor(nc);
> +			if (state =3D=3D NCSI_CHANNEL_ACTIVE) {
> +				active =3D nc;
> +				break;

Is the original intention to process the channel one by one?
If it is the case, there are two loops and we might need to use
"goto found" instead.

> +			}
> +		}
> +	}
> +

found: ?

> +	if (!active) {
> +		/* Done */
> +		spin_lock_irqsave(&ndp->lock, flags);
> +		ndp->flags &=3D ~NCSI_DEV_RESET;
> +		spin_unlock_irqrestore(&ndp->lock, flags);
> +		return ncsi_choose_active_channel(ndp);
> +	}
> +
> +	spin_lock_irqsave(&ndp->lock, flags);
> +	ndp->flags |=3D NCSI_DEV_RESET;
> +	ndp->active_channel =3D active;
> +	ndp->active_package =3D active->package;
> +	spin_unlock_irqrestore(&ndp->lock, flags);
> +
> +	nd->state =3D ncsi_dev_state_suspend;
> +	schedule_work(&ndp->work);
> +	return 0;
> +}


Also similar issue in ncsi_choose_active_channel() function below.

> @@ -916,32 +1045,49 @@ static int ncsi_choose_active_channel(struct ncsi_=
dev_priv *ndp)
> =20
>  			ncm =3D &nc->modes[NCSI_MODE_LINK];
>  			if (ncm->data[2] & 0x1) {
> -				spin_unlock_irqrestore(&nc->lock, flags);
>  				found =3D nc;
> -				goto out;
> +				with_link =3D true;
>  			}
> =20
> -			spin_unlock_irqrestore(&nc->lock, flags);
> +			/* If multi_channel is enabled configure all valid
> +			 * channels whether or not they currently have link
> +			 * so they will have AENs enabled.
> +			 */
> +			if (with_link || np->multi_channel) {

I notice that there is a case that we will misconfigure the interface.
For example below, multi-channel is not enable for package 1.
But we enable the channel for ncsi2 below (package 1 channel 0) as that int=
erface is the first
channel for that package with link.

cat /sys/kernel/debug/ncsi_protocol/ncsi_device_
IFIDX IFNAME NAME   PID CID RX TX MP MC WP WC PC CS PS LS RU CR NQ HA
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  2   eth2   ncsi0  000 000 1  1  1  1  1  1  0  2  1  1  1  1  0  1
  2   eth2   ncsi1  000 001 1  0  1  1  1  1  0  2  1  1  1  1  0  1
  2   eth2   ncsi2  001 000 1  0  1  0  1  1  0  2  1  1  1  1  0  1
  2   eth2   ncsi3  001 001 0  0  1  0  1  1  0  1  0  1  1  1  0  1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
MP: Multi-mode Package     WP: Whitelist Package
MC: Multi-mode Channel     WC: Whitelist Channel
PC: Primary Channel        CS: Channel State IA/A/IV 1/2/3
PS: Poll Status            LS: Link Status
RU: Running                CR: Carrier OK
NQ: Queue Stopped          HA: Hardware Arbitration

I temporally change to the following to avoid that.
			if ((with_link &&
			     !np->multi_channel &&
			     list_empty(&ndp->channel_queue)) || np->multi_channel) {

> +				spin_lock_irqsave(&ndp->lock, flags);
> +				list_add_tail_rcu(&nc->link,
> +						  &ndp->channel_queue);
> +				spin_unlock_irqrestore(&ndp->lock, flags);
> +
> +				netdev_dbg(ndp->ndev.dev,
> +					   "NCSI: Channel %u added to queue (link %s)\n",
> +					   nc->id,
> +					   ncm->data[2] & 0x1 ? "up" : "down");
> +			}
> +
> +			spin_unlock_irqrestore(&nc->lock, cflags);
> +
> +			if (with_link && !np->multi_channel)
> +				break;

Similar issue here. As we are using break, so each package will configure o=
ne active TX.

>  		}
> +		if (with_link && !ndp->multi_package)
> +			break;
>  	}
> =20
> -	if (!found) {
> +	if (list_empty(&ndp->channel_queue) && found) {
> +		netdev_info(ndp->ndev.dev,
> +			    "NCSI: No channel with link found, configuring channel %u\n",
> +			    found->id);
> +		spin_lock_irqsave(&ndp->lock, flags);
> +		list_add_tail_rcu(&found->link, &ndp->channel_queue);
> +		spin_unlock_irqrestore(&ndp->lock, flags);
> +	} else if (!found) {
>  		netdev_warn(ndp->ndev.dev,
> -			    "NCSI: No channel found with link\n");
> +			    "NCSI: No channel found to configure!\n");
>  		ncsi_report_link(ndp, true);
>  		return -ENODEV;
>  	}


Also, for deselect package handler function, do we want to set to inactive =
here?
If we just change the state, the cached data still keeps the old value. If =
the new=20
ncsi_reset_dev() function is handling one by one, can we skip this part?

static int ncsi_rsp_handler_dp(struct ncsi_request *nr)
{
	struct ncsi_rsp_pkt *rsp;
	struct ncsi_dev_priv *ndp =3D nr->ndp;
	struct ncsi_package *np;
	struct ncsi_channel *nc;
	unsigned long flags;

	/* Find the package */
	rsp =3D (struct ncsi_rsp_pkt *)skb_network_header(nr->rsp);
	ncsi_find_package_and_channel(ndp, rsp->rsp.common.channel,
				      &np, NULL);
	if (!np)
		return -ENODEV;

	/* Change state of all channels attached to the package */
	NCSI_FOR_EACH_CHANNEL(np, nc) {
		spin_lock_irqsave(&nc->lock, flags);
		nc->state =3D NCSI_CHANNEL_INACTIVE;

		spin_unlock_irqrestore(&nc->lock, flags);
	}

	return 0;
}
