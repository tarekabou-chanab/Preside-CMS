component output=false {
	property name="passwordPolicyService" inject="passwordPolicyService";

	private string function index( event, rc, prc, args={} ) {
		if ( Len( Trim( args.passwordPolicyContext ?: "" ) ) ) {
			args.passwordPolicy = passwordPolicyService.getPolicy( args.passwordPolicyContext );
			args.policyMessage  = renderContent( renderer="richeditor", data=args.passwordPolicy.message ?: "" );

			event.include( "/js/admin/specific/passwordscore/" )
			     .include( "/css/admin/specific/passwordscore/" );
		}

		return renderView( view="/formcontrols/password/index", args=args );
	}
}