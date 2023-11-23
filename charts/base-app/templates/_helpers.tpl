{{/* 
Generate common labels
 */}}
{{- define "base-app.common-labels" }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/name: {{ include "base-app.resourceName" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app: {{ .Release.Name }}
{{- if .Values.labels }}
{{- range $key, $val := .Values.labels }}
{{ $key }}: {{ $val | quote }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Generate resources name.
*/}}
{{- define "base-app.resourceName" }}
{{- if .Values.fullNameOverride }}
{{- .Values.fullNameOverride }}
{{- else if .Values.nameOverride }}
{{- printf "%s-%s" .Release.Name .Values.nameOverride }}
{{- else }}
{{- .Release.Name }}
{{- end }}
{{- end }}

